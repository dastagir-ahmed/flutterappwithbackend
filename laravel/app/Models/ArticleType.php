<?php
namespace App\Models;
use Encore\Admin\Traits\DefaultDatetimeFormat;
use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;

class ArticleType extends Model
{
    //
    use DefaultDatetimeFormat;
    use ModelTree;
    //table name
    protected $table = 'article_types';

    public function getList(){
        return $this->get();
    }
}

//php artisan admin:make ArticleController --model=App\Model\Article