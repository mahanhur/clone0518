package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.Item;
import com.kbstar.dto.Qna;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.QnaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaService implements KBService<Integer, Qna> {
    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param qna
     */
    @Autowired
    QnaMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param qna
     */
    @Override
    public void register(Qna qna) throws Exception {
        mapper.insert(qna);
    }

    @Override
    public void remove(Integer id) throws Exception {

    }

    @Override
    public void modify(Qna qna) throws Exception {

    }

    @Override
    public Qna get(Integer id) throws Exception {
        return mapper.select(id);
    }

    @Override
    public List<Qna> get() throws Exception {
        return mapper.selectall();
    }

    public Qna getanswer(Integer id) throws Exception {
        return mapper.getanswer(id);
    }


    public Page<Qna> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 5); // 3: 한화면에 출력되는 개수
        return mapper.getpage();
    }
}
