//　　ヘッダーのメニュー操作

//　トグルリスナーを追加する
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
  //ロード直後、colapseを追加/削除
  addToggleListener("hamburger", "navbar-menu", "collapse");
  //accountをクリック時に、activeを追加/削除
  addToggleListener("account", "dropdown-menu", "active");
})
