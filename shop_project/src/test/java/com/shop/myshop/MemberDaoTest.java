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
//   @Inject //�ڵ� �����Ͽ� ���� @autowired�� ����
//   private MemberDao dao;
//   //�θ��� ���������� �޼ҵ�� �ڵ����� �ڽ� �޼ҵ带 ����
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
//		   System.out.println("���̵� �����ϴ�");
//	   else
//		   System.out.println("���" + vo);
//   }
//   @Test //test annotation�� ���̸� ����
//   public void testReadWithMember() throws Exception{
//	   MemberVo vo = dao.readWithPw("bbb", "user00");
//	   if(vo==null)
//		   System.out.println("���̵� �Ǵ� �н����� �߸�");
//	   else
//		   System.out.println("����� :" + vo);
//   }
//}