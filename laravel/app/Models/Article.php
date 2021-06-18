<?php
namespace App\Models;
use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    use DefaultDatetimeFormat;
    //table name
    protected $table = 'articles';
    
    public function ArticleType(){
        return $this->hasOne(ArticleType::class, 'id', 'type_id');
    }
    public function getRecommended(){
        return $this->where(['is_recommend'=>1])->orderBy('id', 'DESC')->limit(3)->get();
    }
    public function getUnRecommended(){
        return $this->where(['is_recommend'=>0])->orderBy('id', 'DESC')->limit(3)->get();
    }
    public function getWelcomeInfo(){
        return $this->where(['type_id'=>3])->orderBy('id', 'DESC')->limit(3)->get();
    }
    public function getRecent(){
        return $this->limit(5)->orderBy('id', 'DESC')->get();
    }
    public function getAllArticles(){
        return $this->orderBy('id', 'DESC')->get();
    }


}

//php artisan admin:make ArticleController --model=App\Model\Article