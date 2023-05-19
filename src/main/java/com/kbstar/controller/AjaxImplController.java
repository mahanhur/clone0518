package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AjaxImplController {
    @Autowired
    CustService custService;

    @RequestMapping("/checkid")
    public Object checkid(String id) throws Exception {
        int result = 0;
        Cust cust = null;
        cust = custService.get(id);
        if (cust != null) {
            result = 1;
        }
        return result;
    }
}
