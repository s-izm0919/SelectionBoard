import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.stream.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ThreadBean;
import bean.ResThreadBean;
import dba.CreateSQL;
import dba.OracleDBAccess;
import deal.CountAggrement;

public class ResThreadServlet extends HttpServlet {
	
	//ArrayList���g�p
	private ArrayList<ThreadBean> database = new ArrayList<ThreadBean>();
	private ArrayList<ResThreadBean> resdatabase = new ArrayList<ResThreadBean>();

	private ArrayList<Integer> votingdata = new ArrayList<Integer>();
	

	String id = null;

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		//POST�v���ɂ���đ��M���ꂽ��������N���C�A���g��
		//�G���R�[�h�����Ƃ��̕����R�[�h���w�肷��
		//������w�肵�Ȃ��ƕ�����������\��������
		req.setCharacterEncoding("Windows-31J");

		id = req.getParameter("reid");

		//POST�v���ɂ���đ��M���ꂽ�p�����[�^���擾����
		String name = req.getParameter("rename");
		//name�����M����Ă��Ȃ��ꍇ�́A�����I��NONAME�ƂȂ�
		
		if(name==""){
			name=new String("NONAME");
		}
		
		
		String content = req.getParameter("recontent");

		if(content==""){
			content=new String("���e���͂���܂���B");
		}
		String voting = req.getParameter("revoting");

		CreateSQL cre = new CreateSQL();
		String insert_sql = cre.insertResThread(id, name, content, voting);

		OracleDBAccess odba = new OracleDBAccess();
		odba.insertDB(insert_sql);

		doGet(req, res);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("Windows-31J");
        
        if(id == null){		
			id = req.getParameter("id");
		}

		//SELECT���̎��s
		CreateSQL cre = new CreateSQL();
		String select_sql = cre.selectOne(id);
		String resselect_sql = cre.selectResAll(id);

		OracleDBAccess odba = new OracleDBAccess();
		odba.selectDB(select_sql);
		ThreadBean bean = odba.getThreadBean();

		odba.selectResDB(resselect_sql);
		resdatabase = odba.getResDatabase();

		votingdata = odba.getVotingData();

		Stream<Integer> stream1 = votingdata.stream();
		Stream<Integer> stream2 = votingdata.stream();

		long agreement = stream1.filter(number -> number == 1).count();
		long disagreement = stream2.filter(number -> number == 2).count();

		req.setAttribute("agreement", agreement);
		req.setAttribute("disagreement", disagreement);

		//HttpServletRequest�̎����N���X�̃C���X�^���X��
		//users�Ƃ������O�Ńf�[�^��o�^����
		req.setAttribute("data",bean);
		req.setAttribute("resdatabase",resdatabase);

		id = null;
		
		//RequestDispatcher�C���^�[�t�F�C�X����������N���X��
		//�C���X�^���X���擾����
		//�����͓]�����URL
		RequestDispatcher dispatcher=
			req.getRequestDispatcher("resthreadlist");
		
		//�]����ɗv����]������
		dispatcher.forward(req,res);
	}
}