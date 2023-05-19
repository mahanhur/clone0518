package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Item;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ItemMapper extends KBMapper<Integer, Item> {

    Page<Item> getpage() throws Exception;

    public List<Item> gettopcate(Integer topcate);
    public List<Item> getcateid(Integer cateid);
}
