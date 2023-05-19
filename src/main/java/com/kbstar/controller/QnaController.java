package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Cart;
import com.kbstar.dto.Cust;
import com.kbstar.dto.Item;
import com.kbstar.dto.Qna;
import com.kbstar.service.CartService;
import com.kbstar.service.ItemService;
import com.kbstar.service.QnaService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/qna")
public class QnaController {

    @Autowired
    ItemService itemService;

    @Autowired
    QnaService qnaService;

    String dir = "qna/";

    @RequestMapping("")
    public String qna(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        List<Qna> list = null;
        list = qnaService.get();
        model.addAttribute("qna", list);
//        model.addAttribute("cpage",p);
        model.addAttribute("center", dir+"qna");
        return "index";
    }

    @RequestMapping("/detail")
    public String qnadetail(Model model, int id) throws Exception {
        Qna qna = null;
        qna = qnaService.get(id);
        Qna qna1 = null;
        qna1 = qnaService.getanswer(id);
        if (qna1 == null) {
            qna1 = new Qna();
            qna1.setContent("답변이 아직 준비되지 않았습니다.");
        }
        model.addAttribute("qna", qna);
        model.addAttribute("ans", qna1);
        model.addAttribute("center", dir+"qnadetail");

        return "index";
    }
    @RequestMapping("/add")
    public String qnaadd(Model model, HttpSession session) throws Exception {
        Cust cust = (Cust) session.getAttribute("logincust");
        String id = cust.getId();
        model.addAttribute("custid", id);
        model.addAttribute("center", dir+"qnaadd");

        return "index";
    }
    @RequestMapping("/addimpl")
    public String qnaaddimpl(Model model,Qna qna) throws Exception {
        qnaService.register(qna);

        return "redirect:/qna";
    }
}
