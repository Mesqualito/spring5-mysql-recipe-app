package com.eigenbaumarkt.spring5_mysql_recipe_app.services;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by jt on 7/3/17.
 */
public interface ImageService {

    void saveImageFile(Long recipeId, MultipartFile file);
}
