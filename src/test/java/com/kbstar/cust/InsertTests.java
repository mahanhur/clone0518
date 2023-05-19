package com.kbstar.cust;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
class InsertTests {
	@Autowired
	CustService service;

	@Test
	void contextLoads() {
		Cust obj = new Cust("user365", "pwd365", "민아", 1, "F" );
		try {
			service.register(obj);
			log.info("등록정상...");
		} catch (Exception e) {
			if (e instanceof DuplicateKeyException) {
				log.info("......ID가 중복되었습니다.......");
			} else {
				log.info("......시스템장애입니다.........");
				e.printStackTrace();
			}

		}
	}
}
