<?php

namespace App\Http\Controllers;
use App\Models\Article;
use App\Models\ArticleType;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class ArticlesController extends Controller
{
    
    
    
    public function welcomeInfo(){
        $list = new Article();
        $list = $list->getWelcomeInfo();
        //$list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']); 
        }
        return response()->json($list);
    }
    

}
