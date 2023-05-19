package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Cart;
import com.kbstar.dto.Cust;
import com.kbstar.dto.Item;
import com.kbstar.service.CartService;
import com.kbstar.service.CustService;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class MainController {

    @Autowired
    CustService custService;
    @Autowired
    ItemService itemService;
    @Autowired
    CartService cartService;
    @Autowired
    private BCryptPasswordEncoder encoder;


    @RequestMapping("/")
    public String main(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<Item> p;
        //list = itemService.get();
        try {
            p = new PageInfo<>(itemService.getPage(pageNo), 5);
            // 5:하단 네비게이션 페이지개수
        } catch (Exception e) {
            throw new Exception("시스템장애: ER0002");
        }
        model.addAttribute("target","");
        model.addAttribute("cpage",p);
        model.addAttribute("left","left");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center","login");
        return "index";
    }
    @RequestMapping("/logout")
    public String logout(Model model, HttpSession session){
        if(session != null){
            session.invalidate();
        }
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        log.info("----------------" + id + pwd);
        Cust cust = null;
        String nextPage = "loginfail";
        try {
            cust = custService.get(id);
            if (cust != null && encoder.matches(pwd, cust.getPwd())) {
                nextPage = "loginok";
                session.setMaxInactiveInterval(100000);
                session.setAttribute("logincust", cust);
            }
        } catch (Exception e) {
            throw new Exception("시스템 장애 잠시후 다시 로그인 하세요");
        }

        model.addAttribute("center", nextPage);
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center","register");

        return "index";
    }
    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Cust cust, HttpSession session) throws Exception {

        try {
            cust.setPwd(encoder.encode(cust.getPwd()));
            custService.register(cust);
            // 회원가입 즉시 로그인처리 로그인된 화면 보여주기..
            session.setAttribute("logincust", cust);

        } catch (Exception e) {
            throw new Exception("가입 오류");
        }

        model.addAttribute("rcust", cust);
        model.addAttribute("center", "registerok");
        return "index";
    }
    @RequestMapping("/custinfo")
    public String custinfo(Model model, String id, Cust cust) throws Exception {

            cust = custService.get(id);
            log.info(String.valueOf(cust));

        model.addAttribute("custinfo", cust);
        model.addAttribute("center", "custinfo");
        return "index";
    }

    @RequestMapping("/custinfoimpl")
    public String custinfoimpl(Model model, Cust cust) throws Exception {

        try {
            cust.setPwd(encoder.encode(cust.getPwd()));
            custService.modify(cust);
        } catch (Exception e) {
            throw new Exception("시스템장애");
        }
        return "redirect:/custinfo?id=" + cust.getId();
    }

    @RequestMapping("/cart")
    public String cart(Model model, String cid) throws Exception {
        List<Cart> list = null;
        try {
            list = cartService.getMyCart(cid);
        } catch (Exception e) {
            throw new Exception("시스템장애:ERORR002");
        }

        model.addAttribute("allcart", list);
        model.addAttribute("center", "cart");
        return "index";
    }

    @RequestMapping("/addcart")
    public String addcart(Model model, Cart cart) throws Exception {
        cartService.register(cart);
        return "redirect:/item/cart?cid=" + cart.getCust_id();
    }

    @RequestMapping("/delcart")
    public String delcart(Model model, Integer id, HttpSession session) throws Exception {
        log.info("=========================================="+ id);
        cartService.remove(id);
        if (session != null) {
            Cust cust = (Cust) session.getAttribute("logincust");
            return "redirect:/item/cart?cid=" + cust.getId();
        }
        return "redirect:/";
    }

    @RequestMapping("/updatecart")
    public String updatecart(Model model, Cart cart,Integer cnt, HttpSession session) throws Exception {
        log.info("=========================================="+ cart);
        cart.setCnt(cnt);
        cartService.modify(cart);
        if (session != null) {
            Cust cust = (Cust) session.getAttribute("logincust");
            return "redirect:/item/cart?cid=" + cust.getId();
        }
        return "redirect:/";
    }


    @RequestMapping("/ws")
    public String ws(Model model, HttpSession session) {
        model.addAttribute("center", "ws");
        return "index";
    };

//    @RequestMapping("/allcart")
//    public String allcart(Model model, String id) throws Exception {
//        List<Cart> list = null;
//
//        try {
//            list = cartService.getMyCart(id);
//        } catch (Exception e) {
//            throw new Exception("시스템장애: ER0002");
//        }
//        model.addAttribute("allcart", list);
//        model.addAttribute("center", "cart");
//        return "index";
//    }

//    @RequestMapping("/addcart")
//    public String addcart(Model model, Cart cart) throws Exception {
//        cartService.register(cart);
//        return "redirect:/item/allcart?id=" + cart.getCust_id();
//    }
//
//    @RequestMapping("/updatecart")
//    public String updatecart(Model model, Cart cart, HttpSession session) throws Exception {
//        cartService.modify(cart);
//        if (session != null) {
//            Cust cust = (Cust) session.getAttribute("logincust");
//            return "redirect:/item/allcart?id=" + cust.getId();
//        }
//        return "redirect:/";
//    }
//
//    @RequestMapping("/delcart")
//    public String delcart(Model model, Integer id, HttpSession session) throws Exception {
//        cartService.remove(id);
//        //세션이 사라질지 모름. 반드시!
//        if (session != null) {
//            Cust cust = (Cust) session.getAttribute("logincust");
//            return "redirect:/item/allcart?id=" + cust.getId();
//        }
//        return "redirect:/";
//    }
}
