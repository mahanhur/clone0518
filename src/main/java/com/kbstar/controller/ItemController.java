package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Cart;
import com.kbstar.dto.Cust;
import com.kbstar.dto.Item;
import com.kbstar.service.CartService;
import com.kbstar.service.ItemService;
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
@RequestMapping("/item")
public class ItemController {

    @Autowired
    ItemService itemService;

    @Autowired
    CartService cartService;

    String dir = "item/";

    @RequestMapping("")
    public String main(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model, Integer id) throws Exception {
        Item item = null;
        item = itemService.get(id);
        model.addAttribute("gitem", item);
        model.addAttribute("left", "left");
        model.addAttribute("center", "center");
        return "index";
    }


    @RequestMapping("/top")
    public String top(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.getTopcate(100);
        log.info(list.toString());
        model.addAttribute("allitem", list);
        model.addAttribute("left", dir + "topleft");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/bottom")
    public String bottom(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.getTopcate(200);
        log.info(list.toString());
        model.addAttribute("allitem", list);
        model.addAttribute("left", dir + "bottomleft");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/shoes")
    public String shoes(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.getTopcate(300);
        log.info(list.toString());
        model.addAttribute("allitem", list);
        model.addAttribute("left", dir + "shoesleft");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/tshirt")
    public String tshirt(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.getCateid(110);
        model.addAttribute("allitem", list);
        model.addAttribute("left", dir + "topleft");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/jacket")
    public String jacket(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.getCateid(120);
        model.addAttribute("allitem", list);
        model.addAttribute("left", dir + "topleft");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/shirt")
    public String shirt(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.getCateid(130);
        model.addAttribute("allitem", list);
        model.addAttribute("left", dir + "topleft");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/jeans")
    public String jeans(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.getCateid(210);
        model.addAttribute("allitem", list);
        model.addAttribute("left", dir + "bottomleft");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/half")
    public String half(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.getCateid(220);
        model.addAttribute("allitem", list);
        model.addAttribute("left", dir + "bottomleft");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/skirt")
    public String skirt(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.getCateid(230);
        model.addAttribute("allitem", list);
        model.addAttribute("left", dir + "bottomleft");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/sneakers")
    public String sneakers(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.getCateid(310);
        model.addAttribute("allitem", list);
        model.addAttribute("left", dir + "shoesleft");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/slipper")
    public String slipper(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.getCateid(320);
        model.addAttribute("allitem", list);
        model.addAttribute("left", dir + "shoesleft");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/loafers")
    public String loafers(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.getCateid(330);
        model.addAttribute("allitem", list);
        model.addAttribute("left", dir + "shoesleft");
        model.addAttribute("center", dir + "center");
        return "index";
    }
}
//@RequestMapping(value = { "/top", "/bottom", "/shoes", "/tshirt", "/jacket", "/shirt", "/jeans", "/half", "/skirt", "/sneakers", "/slipper", "/loafers" })
//public String categoryPage(@RequestParam(required = false) Integer category, Model model) throws Exception {
//    List<Item> list = null;
//    String leftTemplate = "";
//    if (category == null) {
//        throw new Exception("카테고리를 선택해주세요.");
//    } else if (category >= 100 && category < 200) {
//        leftTemplate = dir + "topleft";
//    } else if (category >= 200 && category < 300) {
//        leftTemplate = dir + "bottomleft";
//    } else if (category >= 300 && category < 400) {
//        leftTemplate = dir + "shoesleft";
//    }
//    list = itemService.getCateid(category);
//    model.addAttribute("allitem", list);
//    model.addAttribute("left", leftTemplate);
//    model.addAttribute("center", dir + "center");
//    return "index";
//}
//}
