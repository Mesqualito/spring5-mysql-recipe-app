package com.eigenbaumarkt.spring5_mysql_recipe_app.repositories;

import com.eigenbaumarkt.spring5_mysql_recipe_app.domain.Recipe;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by jt on 6/13/17.
 */
public interface RecipeRepository extends CrudRepository<Recipe, Long> {
}
