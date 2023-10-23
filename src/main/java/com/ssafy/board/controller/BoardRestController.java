package com.ssafy.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.board.model.dto.Board;
import com.ssafy.board.model.dto.SearchCondition;
import com.ssafy.board.model.service.BoardService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import springfox.documentation.annotations.ApiIgnore;

//목록 GET + ___ : 8080/context-root/api/board
//상세보기 GET +           ""            /board/{id}
//등록 POST +             ""            /board
//수정 PUT +              ""            /board or /board/{id}
//삭제 DELETE +           ""            /board/{id}

@RestController
@RequestMapping("/api")
@Api(tags="게시판 컨트롤러")
@CrossOrigin("*")
public class BoardRestController {

	@Autowired
	private BoardService boardService;
	
	//1. 목록(검색조건이 있을 수도 있고 없을 수도 있다)
	@GetMapping("/board")
	@ApiOperation(value="게시글 조회", notes="검색조건도 같이 넘기면 넘어온다")
	public ResponseEntity<?> list(SearchCondition condition) {
//		List<Board> list = boardService.getList(); //전체조회
		List<Board> list = boardService.search(condition);
		
		if(list == null || list.size() == 0) 
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		
		return new ResponseEntity<List<Board>> (list, HttpStatus.OK);
	}
	
	//2. 상세보기
	@GetMapping("/board/{id}")
	public ResponseEntity<Board> detail(@PathVariable int id) {
		Board board = boardService.getBoard(id);
		//정석대로면 게시글 제목을 클릭해서 상세보기로 들어가니 여기서 마무리
		//주소창을 통해 접근하려하는 사람이 있을 수도 있으니 없는 값을 넣을 때의 처리 필요
		
		return new ResponseEntity<Board>(board, HttpStatus.OK);
	}
	
	//3. 등록
	@PostMapping("/board")
	public ResponseEntity<Board> write(Board board) {
		boardService.writeBoard(board);
		
		//ID는 어차피 중복이 안되기 때문에 게시글 등록이 무조건 된다.
		//문제가 발생하여 게시글 등록이 안될 경우를 위해 조건을 새로 달 필요가 있다. (행의 변환 개수 등을 이용)
		return new ResponseEntity<Board> (board, HttpStatus.CREATED);
	}
	
	//4. 삭제
	@DeleteMapping("/board/{id}")
	public ResponseEntity<Void> delete(@PathVariable int id) {
		boardService.removeBoard(id);
		
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	//5. 수정
	@ApiIgnore
	@PutMapping("/board")
	public ResponseEntity<Void> update(@RequestBody Board board) {
		boardService.modifyBoard(board);
		
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}
