package member.memberdao;

import org.apache.ibatis.session.SqlSession;

import member.memberdto.MemberDTO;

public class MemberDAO {
	private SqlSession sqlSession;

	public MemberDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public String checkLogin(MemberDTO dto) {
		String name = null;
		
		name = sqlSession.selectOne("mapper.member_checklogin", dto );
		
		return name;
	}
	
	public String findPass(MemberDTO dto) {
		String password = null;
		
		password = sqlSession.selectOne("mapper.member_findpass", dto);
		
		return password;
	}
	
	public String findId(MemberDTO dto) {
		String id = null;
		
		id = sqlSession.selectOne("mapper.member_findid", dto);
		
		return id;
	}
	
	public int insert(MemberDTO dto) {
		int check = 0;
		
		check = sqlSession.insert("mapper.join_insert", dto);
		
		return check;
	}
	
	public MemberDTO getValues(String id) {
		MemberDTO dto = null;
		
		dto = sqlSession.selectOne("mapper.get_values", id);
		
		return dto;
	}
	
	public int updateMember(MemberDTO dto) {
		int check = 0;
		
		check = sqlSession.update("mapper.update_member", dto);
		
		return check;
	}
	
	public int deleteMember(int no) {
		int check = 0;
		check = sqlSession.delete("mapper.delete_member", no);
		return check;
	}
	
}
