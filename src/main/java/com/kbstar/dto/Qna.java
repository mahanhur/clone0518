package com.kbstar.dto;

import lombok.*;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Qna {
    private int id;
    private String title;
    private String content;
    private String rdate;
    private int q_id;
    private String cust_id;
    private String admin_id;
}
