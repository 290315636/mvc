//获取cookie中的语言
var language = document.cookie.match(/language=([^;]+)/);
var locale = "zh-cn";
if(language){
    locale = language[1].split("_")[0];
}

requirejs.config({
    baseUrl:'/static/js',//根路径
    paths: {//模块对应的具体路径
        "jquery": "lib/jquery",
        "helper": "test/helper",
        "api": "test/api",
        "api2": "test/api2",
        "user": "test/user",
        "modernizr": "lib/modernizr",
        "bootstrap": "lib/bootstrap",
        "text": "lib/text",  //从html页面读取内容
        "i18n": "lib/i18n",   //国际化处理
        "backbone": "lib/backbone",  //mvc
        "underscore": "lib/underscore"
    },
    shim: {//不支持AMD的模块处理；AMD：文件异步加载
        "modernizr": {//检测浏览器新特性如h5等等支持性
            exports: "Modernizr"    //全局变量导入到require js 模块
        },
        "bootstrap": ["jquery",
            "css!/static/css/bootstrap.css",
            "css!/static/css/bootstrap-theme.css"]    //依赖jquery
    },
    map: {//控制加载的版本
        "*": {//*任意匹配符
            "jquery": "jquery",  //不能是相对路径
            "css": "lib/css"
        },
        "api2": {
            "jquery": "jquery2"
        }
    },
    waitSeconds: 0,  //默认加载等待时间7妙
    urlArgs: "_=" + (new Date()).getTime(), //下载文件时，在URL后面额外增加的query参数
    config: {
        text: {//配置text插件的配置
            onXhr: function(xhr,url){
                xhr.setRequestHeader("X-Requested-with","XMLHttpRequest");//以js的形式加载
            }
        },
        i18n: {
            locale: locale
        }
    }
});

require(["jquery",
    "helper","api",
    "modernizr",
    "bootstrap",
    "i18n!nls/messages"],function($,helper,api,modernizr,bootstrap,i18n){
    //测试自定义函数
    var str = helper.trim("   AMD   ");
    console.log(str);

    $("#user").click(function(){
        //测试自定义对象
        // api.getUser().then(function(user){
        //     console.log(user);
        // });

        //测试text插件
        // api.loadUser();

        //测试i18n
        $(this).after("<button class='btn btn-default'>"+i18n.edit+"</button>");
    });

    //测试AMD处理模块
    console.log(modernizr);

});
