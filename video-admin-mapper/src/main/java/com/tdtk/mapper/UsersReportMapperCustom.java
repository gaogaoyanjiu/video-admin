package com.tdtk.mapper;

import com.tdtk.pojo.UsersReport;
import com.tdtk.pojo.vo.Reports;

import java.util.List;

public interface UsersReportMapperCustom {
    List<Reports> selectAllVideoReport();

    void delVideoReport(UsersReport userReport);
}