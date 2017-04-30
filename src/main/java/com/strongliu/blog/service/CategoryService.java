package com.strongliu.blog.service;

import com.strongliu.blog.dao.CategoryDao;
import com.strongliu.blog.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by liuyuzhe on 2017/2/10.
 */

@Service
public class CategoryService {

    @Autowired
    private CategoryDao categoryDao;

    public Category findCategoryById(Integer id) {
        return categoryDao.selectById(id);
    }

    /**
     * 查找分类
     */
    public Category findCategoryBySlug(String slug)
    {
        return categoryDao.selectBySlug(slug);
    }

    public List<Category> findAllCategoryByIdList(List<Integer> idList) {
        return categoryDao.selectAllByIdList(idList);
    }

    public List<Category> findAllCategory()
    {
        return categoryDao.selectAll();
    }

    public int addCategory(Category category) {
        return categoryDao.insert(category);
    }

    public int updateCategory(Category category) {
        return categoryDao.update(category);
    }

    public int updatePostCount(Integer id, Integer number) {
        return categoryDao.updatePostCount(id, number);
    }

    public int removeCategoryById(Integer id) {
        return categoryDao.deleteById(id);
    }
}
