package member.action;

import javax.servlet.*;
import javax.servlet.http.*;

import ch19.action.CommandAction;

public class LogoutAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		return "/member/logout.jsp";
	}

}
