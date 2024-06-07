package com.cn.shixun.pojo;

public class Result {

    private int code;

    private String info;

    private Object data;

    public Result(int code, String info, Object data) {
        this.code = code;
        this.info = info;
        this.data = data;
    }
    public int getCode() {
        return code;
    }
    public void setCode(int code) {
        this.code = code;
    }
    public String getInfo() {
        return info;
    }

}
