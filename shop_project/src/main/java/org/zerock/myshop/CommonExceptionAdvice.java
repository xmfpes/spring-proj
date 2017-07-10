package org.zerock.myshop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

//예외처리를 위한 클래스를 만들겠다는 어노테이션
@ControllerAdvice
public class CommonExceptionAdvice {
   
   private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
   
//   @ExceptionHandler(Exception.class)
//   public String common(Exception e){
//	   logger.info(e.toString());
//	   
//	   return "error_common";
//   }
   
//   //예외가 생겼을때 이 메소드를 실행한다
//   @ExceptionHandler(Exception.class)
//   private ModelAndView errorModelAndView(Exception ex){
//	   
//	   ModelAndView modelAndView = new ModelAndView();
//	   modelAndView.setViewName("/error_common");
//	   modelAndView.addObject("exception", ex);
//	   
//	   return modelAndView;
//   }
}