function openNav() {
    document.getElementById("mySidenav").style.width = "280px";
    document.getElementById("main").style.marginLeft = "280px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}


function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
    document.body.style.backgroundColor = "white";
}

function stickmenu() {
    if (window.pageYOffset >= 100) {
        document.getElementById("header").style.position = "fixed";
        document.getElementById("header").style.zIndex = "1";
        document.getElementById("header").style.opacity = "0.9";
        
        document.getElementById("cate").style.top="90px"
    } else {
        document.getElementById("header").style.position = "relative";
        document.getElementById("header").style.zIndex = "0";
        document.getElementById("header").style.opacity = "1";
       
        document.getElementById("cate").style.top="130px"
    }
}
