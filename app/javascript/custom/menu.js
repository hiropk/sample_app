//　　ヘッダーのメニュー操作

// トグルリスナーを追加してクリックをリッスンする
//documentオブジェクトに対してロード直後にリスナーを追加
document.addEventListener("turbo:load", function() {
  //idがaccountのタグオブジェクトをaccount変数の格納
  let account = document.querySelector("#account");
  //accountにclickイベントリスナーfunction(event)を追加する
  account.addEventListener("click", function(event){
    //eventオブジェクトのデフォルトの挙動をキャンセルする
    event.preventDefault();
    //idがdropdown-menuのタグオブジェクトをmenu変数の格納
    let menu = document.querySelector("#dropdown-menu");
    //menuに対してactiveクラスを追加する。ドロップダウン機能を有効にする。
    menu.classList.toggle("active");
  });
});
