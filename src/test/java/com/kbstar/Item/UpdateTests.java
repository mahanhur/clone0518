package com.kbstar.Item;

import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTests {
    @Autowired
    ItemService service;

    @Test
    void contextLoads() {

        try {
            service.modify(new Item(0, 10, "5000", 10, null,null));
            log.info("수정완료");
        } catch (Exception e) {

            log.info("......에러다.........");
            e.printStackTrace();
        }

    }
}

