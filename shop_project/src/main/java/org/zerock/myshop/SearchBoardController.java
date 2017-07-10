package org.zerock.myshop;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BoardService;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {
   
   private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);

   @Inject
   private BoardService service;
   
   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	   
	   logger.info(cri.toString());
	   
//	   model.addAttribute("list", service.listCriteria(cri));
	   model.addAttribute("list", service.listSearchCriteria(cri));
	   
	   PageMaker pageMaker = new PageMaker();
	   pageMaker.setCri(cri);
	   
//	   pageMaker.setTotalCount(service.listCountCriteria(cri));
	   pageMaker.setTotalCount(service.listSearchCount(cri));
	   model.addAttribute("pageMaker", pageMaker);
   }
   @RequestMapping(value = "/register", method = RequestMethod.GET)
   public void registerGET(BoardVO board, Model model) throws Exception {
      logger.info("register get.....");
   }
   
   @RequestMapping(value = "/register", method = RequestMethod.POST)
   public String registerPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
      logger.info("register post.....");
      logger.info(board.toString());
      
      service.regist(board);
      rttr.addFlashAttribute("msg","SUCCESS");
      
      return "redirect:/sboard/list";
   }
   @RequestMapping(value = "/readPage", method = RequestMethod.GET)
   public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	   logger.info("값값 :" + cri);
	   model.addAttribute(service.read(bno));
   }   
   @RequestMapping(value = "/removePage", method = RequestMethod.POST)
   public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
	   
	   service.remove(bno);
	   
	   //RedirectAttribute는 Get방식으로 주소로 전달됨
	   rttr.addAttribute("page", cri.getPage());
	   rttr.addAttribute("perPageNum", cri.getPerPageNum());
	   rttr.addAttribute("searchType", cri.getSearchType());
	   rttr.addAttribute("keyword", cri.getKeyword());
	   
	   rttr.addFlashAttribute("msg", "REMOVESUCCESS");
	   //RedirectAttribute는 jsp가 없이 넘어가기 때문에 바로 redirect로 넘겨줌
	   logger.info("삭제값" + rttr.addAttribute("page", cri.getPage()) + " : " + rttr.addAttribute("perPageNum", cri.getPerPageNum()));
	   return "redirect:/sboard/list";
   }
   @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
   public void modifyPagingGET(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	   logger.info("modify get");
	   model.addAttribute(service.read(bno));
   }
   //@ModelAttribute는 jsp에 뿌려줄때 씀
   @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
   public String modifyPOST(BoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
	   
	   logger.info("modify post");
	   service.modify(board);
	   
	   rttr.addAttribute("page", cri.getPage());
	   rttr.addAttribute("perPageNum", cri.getPerPageNum());
	   rttr.addAttribute("searchType", cri.getSearchType());
	   rttr.addAttribute("keyword", cri.getKeyword());
	   logger.info("ㅋㅋㅋ:" + cri.getKeyword());
	   
	   rttr.addFlashAttribute("msg", "MODIFYSUCCESS");
	   
	   return "redirect:/sboard/list";
   }
   
   @RequestMapping(value = "/getAttach/{bno}")
   @ResponseBody
   public List<String> getAttach(@PathVariable("bno") Integer bno) throws Exception {
	   
	   return service.getAttach(bno);
   }
   
   
}