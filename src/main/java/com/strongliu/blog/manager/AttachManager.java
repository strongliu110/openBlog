package com.strongliu.blog.manager;

import com.strongliu.blog.entity.Attach;
import com.strongliu.blog.service.AttachService;
import com.strongliu.blog.vo.AttachPageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import java.util.List;

/**
 * Created by liuyuzhe on 2017/5/4.
 */

@Component
public class AttachManager {

    @Autowired
    private AttachService attachService;

    public AttachPageVo getAttachPageVo(int pageId, int limit) {
        List<Attach> attachList = attachService.findAllAttach(pageId, limit);
        if (ObjectUtils.isEmpty(attachList)) {
            return null;
        }

        int attachTotal = attachList.size();
        int pageTotal = attachTotal / limit;
        if (attachTotal % limit != 0) {
            pageTotal += 1;
        }

        AttachPageVo attachPageVo = new AttachPageVo();
        attachPageVo.setAttachList(attachList);
        if (pageId > 0 && pageTotal > 0) {
            attachPageVo.setPageIndex(pageId);
            attachPageVo.setPageTotal(pageTotal);
        }

        return attachPageVo;
    }

    public Attach getAttach(int attachId) {
        Attach attach = attachService.findAttachById(attachId);
        if (attach == null) {
            return null;
        }

        return attach;
    }

    public Attach getAttach(String attachSlug) {
        Attach attach = attachService.findAttachBySlug(attachSlug);
        if (attach == null) {
            return null;
        }

        return attach;
    }

    public int addAttach(Attach attach) {
        attachService.addAttach(attach);
        return attach.getId();
    }

    public int removeAttach(int attachId) {
        return attachService.removeAttach(attachId);
    }
}
