package com.strongliu.blog.dao;

import java.util.List;

import com.strongliu.blog.entity.Category;

public interface CategoryDao {

	Category selectById(int id);

	Category selectByName(String name);

	List<Category> selectAll();
}
