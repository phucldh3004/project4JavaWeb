/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phucldh.dtos;

/**
 *
 * @author nkokp
 */
public class PostDetailDTO {
     int idPostDetail;
    String title;
    String author;
    String Content;
    String publishedTime;

    public PostDetailDTO(int idPostDetail, String title, String author, String Content, String publishedTime) {
        this.idPostDetail = idPostDetail;
        this.title = title;
        this.author = author;
        this.Content = Content;
        this.publishedTime = publishedTime;
    }

    public PostDetailDTO() {
    }

    public int getIdPostDetail() {
        return idPostDetail;
    }

    public void setIdPostDetail(int idPostDetail) {
        this.idPostDetail = idPostDetail;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public String getPublishedTime() {
        return publishedTime;
    }

    public void setPublishedTime(String publishedTime) {
        this.publishedTime = publishedTime;
    }
    
}
