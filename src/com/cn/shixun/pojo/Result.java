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
    public Result() {
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
    public void setInfo(String info) {
        this.info = info;
    }
    public Object getData() {
        return data;
    }
    @Override
    public String toString() {
        return "Result [code=" + code + ", info=" + info + ", data=" + data + "]";
    }
}
