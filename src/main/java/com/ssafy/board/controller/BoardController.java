package com.ssafy.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ssafy.board.model.dto.Board;
import com.ssafy.board.model.dto.SearchCondition;
import com.ssafy.board.model.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

//	@RequestMapping(value = "/", method = RequestMethod.GET)
	@GetMapping("/")
	public String index() {
		// 현재로써는 index.jsp 가 없어서 (대문페이지) 바로 리스트로 요청을 다시 하게끔 돌려보냄.
		return "redirect:list";
	}

	@GetMapping("list")
	public String list(Model model) {
		List<Board> list = boardService.getList();
		model.addAttribute("list", list);
		return "/board/list";
	}

	@GetMapping("detail")
	public String detail(Model model, int id) {
		Board board = boardService.getBoard(id);
		model.addAttribute("board", board);
		return "/board/detail";
	}

	@GetMapping("writeform")
	public String writeform() {
		return "/board/writeform";
	}

	@PostMapping("write")
	public String write(Board board) {
		System.out.println("DB 댕겨오기 전"+board);
		boardService.writeBoard(board);
		System.out.println("DB 댕겨온 후"+board);
//		return "redirect:list";
		return "redirect:detail?id="+board.getId();
	}

	@GetMapping("updateform")
	public String updateform(Model model, int id) {
		// id 게시글 가져와서 모델에 실어놓고 폼으로 보내야겠다.
		// 현재로써는 게시글을 하나 얻어오면 조회수가 하나 증가해버려 ㅠ 사실 잘못된거지.. 하지만 수정할 시간이 없다 ㅎ
		model.addAttribute("board", boardService.getBoard(id));
		return "/board/updateform";
	}

	@PostMapping("update")
	public String update(Board board) {
		System.out.println(board);

		boardService.modifyBoard(board);
		return "redirect:detail?id=" + board.getId();
	}

	@GetMapping("delete")
	public String delete(int id) {
		boardService.removeBoard(id);
		return "redirect:list";
	}

	// 검색기능 추가
	@GetMapping("search")
//	public String search(Model model, String key, String word, String orderBy, String orderByDir) {
	public String search(Model model, SearchCondition condition) {
		
		model.addAttribute("list", boardService.search(condition));
		
		return "/board/list";
	}

}
