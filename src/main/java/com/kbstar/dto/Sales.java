package com.kbstar.dto;

import lombok.*;

import java.util.Date;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Sales {
    private int item_id;
    private String cust_id;
    private int id;
    private Date rdate; // 2023-05-15

}
