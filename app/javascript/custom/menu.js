//　　ヘッダーのメニュー操作

//　トグルリスナーを追加する
//addToggleListener(トグル機能を追加したいタグのid, トグル機能で表示するmenuをもつタグのid, )
function addToggleListener(selected_id, menu_id, toggle_class) {
  let selected_element = document.querySelector(`#${selected_id}`);
  selected_element.addEventListener("click", function(event) {
    event.preventDefault();
    let menu = document.querySelector(`#${menu_id}`);
    menu.classList.toggle(toggle_class);
    console.log(menu);
  });
}

// クリックをリッスンするトグルリスナーを追加する
document.addEventListener("turbo:load", function() {
  //collapseがある　→　navbar-menuが壊れる。
  //collapseがない　→ navbar-menuが生きる。
  addToggleListener("hamburger", "navbar-menu", "collapse");
  //activeを追加するとdropdown-menuが実行される。
  addToggleListener("account", "dropdown-menu", "active");
})
