package controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.memberdao.MemberDAO;
import member.memberdto.MemberDTO;
import mycommon.MyCommon;
import sun.print.resources.serviceui;

@Controller
public class HomeController {
	private MemberDAO member_dao;
	
	public HomeController() {
		
	}
	
	public void setMember_dao(MemberDAO memberDAO) {
		this.member_dao = memberDAO;
	}
	
	@RequestMapping(value = {"/", "/home.do"})
	public String home() {
		return MyCommon.Visit.VIEW_PATH + "home.jsp";
	}
	
	@RequestMapping("/Login.do")
	public String loginForm(HttpServletRequest request, String id, Model model) {
		
		boolean check = true;
		if(id == null){
			Cookie[] cks = request.getCookies();
			
			if(cks != null){
				for(Cookie ck : cks){
					if(ck.getName().equals("ckid")){
						id = ck.getValue();
						check = false;
						break;
					}
				}
			}
			if(check){
				id = "";
			}
		}
		
		model.addAttribute("check", check);
		model.addAttribute("id", id);
		
		return MyCommon.Visit.LOGIN_PATH + "LoginForm.jsp";
	}
	
	//고쳐야 될곳(임시)
	@RequestMapping(value = "/CheckLogin.do", method = RequestMethod.POST)
	public String checkLogin(MemberDTO dto, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		model.addAttribute("dto", dto);
		
		String name = null;
		String msg = null;
		boolean check = false;
		
		name = member_dao.checkLogin(dto);
		
		if(name != null){
			msg = name + "님 환영합니다.";
			check = true;
			
			
			request.getSession().setAttribute("login", dto.getId());
			
			
			//쿠키 생성
			
			String ckid = request.getParameter("ckid");
			
			if(ckid != null){
				Cookie ck = new Cookie("ckid", dto.getId());
				//생존시간 설정...
				ck.setMaxAge(60 * 60);//초 단위로 넣어 주면 된다...
				response.addCookie(ck);//쿠키파일 생성..
			}else{
				Cookie[] cks = request.getCookies();
				if(cks != null){
					for(Cookie ck : cks){
						if(ck.getName().equals("ckid")){
							if(ck.getValue().equals(dto.getId())){
								ck.setMaxAge(0);
								response.addCookie(ck);
							}
							break;
						}
					}
				}
			}
			
		}else{
			msg = "아이디 혹은 비밀번호가 잘못되었습니다.";
		}
		
		model.addAttribute("name", name);
		model.addAttribute("msg", msg);
		model.addAttribute("check", check);
		
		return MyCommon.Visit.LOGIN_PATH + "LoginResult.jsp";
	}
	
	@RequestMapping("/Logout.do")
	public String Logout(HttpServletRequest request) {
		request.getSession().removeAttribute("login");
		
		return MyCommon.Visit.LOGIN_PATH + "Logout.jsp";
	}

	@RequestMapping("/IDPASSFindForm.do")
	public String IDPASSFindForm(Model model, HttpServletRequest request, String mode, String id) {
		if(id == null){
			id = "";
		}

		model.addAttribute("id", id);
		model.addAttribute("mode", mode);
		
		return MyCommon.Visit.LOGIN_PATH + "IDPASSFindForm.jsp";
	}
	
	@RequestMapping("/CheckIdPass.do")
	public String CheckIdPass(Model model, MemberDTO dto) {
		
		String mode = null;

		model.addAttribute("dto", dto);
		
		String password = null;
		String id = dto.getId();
		
		boolean check = false;
		if(id != null) {
			password = member_dao.findPass(dto);
			try {
				password = "***" + password.substring(password.length()-3, password.length());
			}catch(NullPointerException e) {
				
			}
			mode = "pass";
			if(password != null){
				check = true;
			}
		}else {
			id = member_dao.findId(dto);
			mode = null;
			if(id != null){
				check = true;
			}
		}
		model.addAttribute("password", password);
		model.addAttribute("id", id);
		model.addAttribute("name", dto.getName());
		model.addAttribute("check", check);
		model.addAttribute("mode", mode);
		
		return MyCommon.Visit.LOGIN_PATH + "ResultIdPass.jsp";
	}
	
	@RequestMapping("/JoinForm.do")
	public String JoinForm() {
		 return MyCommon.Visit.JOIN_PATH + "JoinForm.jsp";
	}
	
	@RequestMapping("CheckJoin.do")
	public String CheckJoin(Model model, MemberDTO dto) {
		
		model.addAttribute("dto", dto);
		
		int check = member_dao.insert(dto);
		
		model.addAttribute("check", check);
		
		return MyCommon.Visit.JOIN_PATH + "CheckJoin.jsp";
	}
	
	@RequestMapping("/MyPage.do")
	public String MyPage(HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("login");
		MemberDTO dto = member_dao.getValues(id);
		session.setAttribute("member", dto);
		
		if(dto != null) {
			model.addAttribute("dto", dto);
		}
		
		return MyCommon.Visit.JOIN_PATH + "MyPage.jsp";
	}
	
	@RequestMapping("/UpdateForm.do")
	public String UpdateForm(HttpSession session, Model model) {
		
		MemberDTO dto = (MemberDTO) session.getAttribute("member");
		
		if(dto != null) {
			model.addAttribute("dto", dto);
		}
		
		return MyCommon.Visit.JOIN_PATH + "UpdateForm.jsp";
	}
	
	@RequestMapping("/CheckUpdate.do")
	public String CheckUpdate(HttpSession session, String email, String tel1, String tel2, String tel3, Model model) {
		
		MemberDTO dto = (MemberDTO)session.getAttribute("member");
		dto.setEmail(email);
		dto.setTel1(tel1);
		dto.setTel2(tel2);
		dto.setTel3(tel3);
		
		int check = member_dao.updateMember(dto);
		
		model.addAttribute("check", check);
		
		if(check == 1) {
			session.setAttribute("member", dto);
		}
		
		return MyCommon.Visit.JOIN_PATH + "CheckUpdate.jsp";
	}
	
	@RequestMapping("/DeleteForm.do")
	public String DeleteForm(HttpSession session, Model model) {
		String id = (String)session.getAttribute("login");
		
		model.addAttribute("id", id);
		
		return MyCommon.Visit.JOIN_PATH + "DeleteForm.jsp";
	}
	
	@RequestMapping("/CheckDelete.do")
	public String CheckDelete(HttpSession session, String password, Model model) {
		int chk = 0;
		int check = 0;
		
		MemberDTO dto = (MemberDTO)session.getAttribute("member");
		
		System.out.println(dto.getPassword());
		System.out.println(password);
		
		if(dto.getPassword().equals(password)){
			check = member_dao.deleteMember(dto.getNo());
			chk = 1;
			if(check != 0) {
				session.invalidate();
			}
		}
		
		model.addAttribute("check", check);
		model.addAttribute("chk", chk);
		
		return MyCommon.Visit.JOIN_PATH + "CheckDelete.jsp";
	}
}
