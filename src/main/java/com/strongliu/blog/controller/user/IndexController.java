package com.strongliu.blog.controller.user;

import com.strongliu.blog.controller.BaseController;
import com.strongliu.blog.entity.Category;
import com.strongliu.blog.entity.Tag;
import com.strongliu.blog.manager.CategoryManager;
import com.strongliu.blog.manager.PostManager;
import com.strongliu.blog.manager.TagManager;
import com.strongliu.blog.vo.CategoryVo;
import com.strongliu.blog.vo.PostPageVo;
import com.strongliu.blog.vo.PostVo;
import com.strongliu.blog.vo.TagVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by liuyuzhe on 2017/2/10.
 */

@Controller
public class IndexController extends BaseController {

    @Autowired
    private PostManager postManager;
    @Autowired
    private CategoryManager categoryManager;
    @Autowired
    private TagManager tagManager;

    /**
     * 首页
     */
    @RequestMapping(value = {"", "/", "index"}, method = RequestMethod.GET)
    public String index(@RequestParam(value = "page", required = false, defaultValue = "1") Integer pageId,
                        @RequestParam(value = "limit", required = false, defaultValue = "10") Integer limit,
                        Model model) {
        PostPageVo postPageVo = postManager.getPublishPostPageVo(pageId, limit);
        List<Category> categoryList = categoryManager.getAllCategory();
        List<Tag> tagList = tagManager.getAllTag();

        model.addAttribute(postPageVo);
        model.addAttribute(categoryList);
        model.addAttribute(tagList);

        return this.renderUser("index");
    }

    /**
     * 文章页
     */
    @RequestMapping(value = "posts/{slug}", method = RequestMethod.GET)
    public String posts(@PathVariable String slug, Model model) {
        PostVo postVo = postManager.getPublishPostVo(slug);
        if (postVo == null) {
            return this.render_404();
        }

        model.addAttribute(postVo);

        return this.renderUser("post");
    }

    /**
     * 分类页
     */
    @RequestMapping(value = "categories/{slug}", method = RequestMethod.GET)
    public String categories(@PathVariable String slug,
                             @RequestParam(value = "page", required = false, defaultValue = "1") Integer pageId,
                             @RequestParam(value = "limit", required = false, defaultValue = "10") Integer limit,
                             Model model) {
        CategoryVo categoryVo = categoryManager.getCategoryVo(slug, pageId, limit);
        if (categoryVo == null) {
            return this.render_404();
        }

        model.addAttribute(categoryVo);

        return this.renderUser("category");
    }

    /**
     * 标签页
     */
    @RequestMapping(value = "tags/{slug}", method = RequestMethod.GET)
    public String tags(@PathVariable String slug,
                       @RequestParam(value = "page", required = false, defaultValue = "1") Integer pageId,
                       @RequestParam(value = "limit", required = false, defaultValue = "10") Integer limit,
                       Model model) {
        TagVo tagVo = tagManager.getTagVo(slug, pageId, limit);
        if (tagVo == null) {
            return this.render_404();
        }

        model.addAttribute(tagVo);

        return this.renderUser("tag");
    }

}
