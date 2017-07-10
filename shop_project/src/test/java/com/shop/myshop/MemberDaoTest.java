package com.shop.myshop;
//package org.zerock.controller;
//
//
//import javax.inject.Inject;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.zerock.domain.MemberVo;
//import org.zerock.persistence.MemberDao;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
//public class MemberDaoTest {
//   @Inject //자동 주입하여 대입 @autowired와 같다
//   private MemberDao dao;
//   //부모의 개념이지만 메소드는 자동으로 자식 메소드를 받음
//   @Test
//   public void testTime() throws Exception{
//	  System.out.println(dao.getTime());
//   }
//   @Test
//   public void testInsertMember()throws Exception{
//      MemberVo vo=new MemberVo();
//      vo.setUserid("gggg");
//      vo.setUserpw("user00");
//      vo.setUsername("USER00");
//      vo.setEmail("user00@aaa.com");
//      
//      dao.insertMember(vo);
//   }
//   @Test
//   public void testReadember() throws Exception{
//	   MemberVo vo = dao.readMember("bbb");
//	   if(vo==null)
//		   System.out.println("아이디가 없습니다");
//	   else
//		   System.out.println("결과" + vo);
//   }
//   @Test //test annotation을 붙이면 실행
//   public void testReadWithMember() throws Exception{
//	   MemberVo vo = dao.readWithPw("bbb", "user00");
//	   if(vo==null)
//		   System.out.println("아이디 또는 패스워드 잘못");
//	   else
//		   System.out.println("결과값 :" + vo);
//   }
//}