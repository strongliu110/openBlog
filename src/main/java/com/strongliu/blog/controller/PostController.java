package com.strongliu.blog.controller;

import com.strongliu.blog.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.strongliu.blog.entity.Post;

@Controller
@RequestMapping(value="/{postId}", method=RequestMethod.GET)
public class PostController {

	@Autowired
	PostService postService;
	
	public String post(@PathVariable String postId, Model model) {
		Post post = postService.findPostById(postId);
		if (post == null) {
			return "404";
		}
		
		model.addAttribute("post", post);
		
		return "post";
	}

}
