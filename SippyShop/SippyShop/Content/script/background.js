// JavaScript Document
var x=0;
var f=0;
var v=0;
var time=7;
var y2=0;
var time2=0;
var z=200;
var l=200;
var g=0;
var t=0;
var h=200;
var u=250;
var y=100;
var scw=screen.width;
function xxx(){
	var xxxxx=document.getElementsByClassName('thuy');
	xxxxx.item(0).width=scw;
	xxxxx.item(1).width=scw;
	xxxxx.item(2).width=scw;
	xxxxx.item(3).width=scw;
	
}
function liveShow(){
		var tag=document.getElementById("trong");
		tag.style.transform="translateX(-"+x+"px)";
		tag.style.transition="transform 1.5s";
		x=x+scw;
		if(x>=(scw*4)){
			x=0;}
		setTimeout("liveShow()",7000);	
	}
function chuyenut(){
		var arr=document.getElementById("div1");
		switch(x){
			case 0:{
				arr.style.opacity="0";
				break;
				}
			case scw:{
				arr.style.opacity="1";
				break;
				}
			case scw*2:{
				arr.style.opacity="0";
				break;
				}
			case scw*3:{
				arr.style.opacity="0";
				break;
				}
		}
		setTimeout("chuyenut()",7000);
		}
function chuyenut2(){
		var arr=document.getElementById("div2");
		switch(x){
			case 0:{
				arr.style.opacity="0";
				break;
				}
			case scw:{
				arr.style.opacity="0";
				break;
				}
			case scw*2:{
				arr.style.opacity="1";
				break;
				}
			case scw*3:{
				arr.style.opacity="0";
				break;
				}
		}
		setTimeout("chuyenut2()",7000);
		}
function chuyenut3(){
		var arr=document.getElementById("div3");
		switch(x){
			case 0:{
				arr.style.opacity="0";
				break;
				}
			case scw:{
				arr.style.opacity="0";
				break;
				}
			case scw*2:{
				arr.style.opacity="0";
				break;
				}
			case scw*3:{
				arr.style.opacity="1";
				break;
				}
		}
		setTimeout("chuyenut3()",7000);
		}
function chuyenut4(){
		var arr=document.getElementById("div4");
		switch(x){
			case 0:{
				arr.style.opacity="1";
				break;
				}
			case scw:{
				arr.style.opacity="0";
				break;
				}
			case scw*2:{
				arr.style.opacity="0";
				break;
				}
			case scw*3:{
				arr.style.opacity="0";
				break;
				}
		}
		setTimeout("chuyenut4()",7000);
		}
function loadbottom(){
		var tag=document.getElementById("loadbotom");
		tag.style.width=y+"%";
		tag.style.transition="width "+time+"s";
		y=y-100;
		time=time-7;
		if(y<-1){
			y=100;
			time=7;
		}
		setTimeout("loadbottom()",7000);
		}
function loadbo2(){
		var tag2=document.getElementById("loadbotomlan1");
		tag2.style.width=y2+"%";
		tag2.style.transition="width "+time2+"s";
		y2=y2+100;
		time2=time2+7;
		if(y2>101){
			y2=0;
			time2=0;
		}
		setTimeout("loadbo2()",7000);
		}	
function searchbox(){
		document.getElementById("searchbox").style.opacity="1";
	}
function searchboxout(){
		document.getElementById("searchbox").style.opacity="0.4";
	}
function chuchay12(){
		var tag= document.getElementById("div12");
		tag.style.width=z+"px";
		tag.style.transition="width 1s";
		z=z-200;
		if(z<-1){
			z=200;
		}
		setTimeout("chuchay12()",7000);
	}
function chuchay11(){
		var tg= document.getElementById("div11");
		tg.style.width=l+"px";
		tg.style.transition="width 1s";
		l=l-200;
		if(l<-1){
			l=200;
		}
		setTimeout("chuchay11()",7000);
	}
function chuchay22(){
		var tag= document.getElementById("div22");
		tag.style.width=g+"px";
		tag.style.transition="width 1s";
		g=g+200;
		if(g>201){
			g=0;
		}
		setTimeout("chuchay22()",7000);
	}
function chuchay21(){
		var tg= document.getElementById("div21");
		tg.style.width=t+"px";
		tg.style.transition="width 1s";
		t=t+250;
		if(t>251){
			t=0;
		}
		setTimeout("chuchay21()",7000);
	}
function chuchay32(){
		var tag= document.getElementById("div32");
		tag.style.width=h+"px";
		tag.style.transition="width 1s";
		h=h-200;
		if(h<-1){
			h=200;
		}
		setTimeout("chuchay32()",7000);
	}
function chuchay31(){
		var tg= document.getElementById("div31");
		tg.style.width=u+"px";
		tg.style.transition="width 1s";
		u=u-250;
		if(u<-1){
			u=250;
		}
		setTimeout("chuchay31()",7000);
	}
function chuchay42(){
		var tag= document.getElementById("div42");
		tag.style.width=f+"px";
		tag.style.transition="width 1s";
		f=f-200;
		if(f<-1){
			f=200;
		}
		setTimeout("chuchay42()",7000);
	}
function chuchay41(){
		var tg= document.getElementById("div41");
		tg.style.width=v+"px";
		tg.style.transition="width 1s";
		v=v-200;
		if(v<-1){
			v=200;
		}
		setTimeout("chuchay41()",7000);
	}
function dangki(){
		var x=document.getElementById("dangki");
		x.style.width="100%";
		x.style.height="100%"
	}
function exitdangki(){
		var x=document.getElementById("dangki");
		x.style.width="0%";
		x.style.height="0%"
		x.style.overflow="hidden";
	}
function dangnhap(){
		var x=document.getElementById("dangnhap");
		x.style.width="100%";
		x.style.height="100%"
	}
function exitdangnhap(){
		var x=document.getElementById("dangnhap");
		x.style.width="0%";
		x.style.height="0%"
		x.style.overflow="hidden";
	}
function thutra(phu) {
            phu.style.transform="translateX("+25+"px)";
            phu.style.transition = "transform 0.5s";
			setTimeout("thutra()",3000);
        }
function thutvo(phu) {
             phu.style.transform="translateX("+0+"px)";
            phu.style.transition = "transform 0.5s";
			setTimeout("thutvo()",3000);
        }
function create(){
		if(localStorage.getItem("product")==null || localStorage.getItem("product")=="undefined")
			localStorage.setItem("product",0);
		if(localStorage.getItem("num_user")==null || localStorage.getItem("num_user")=="undefined")
			localStorage.setItem("num_user",0);
		if(localStorage.getItem("logged")==null || localStorage.getItem("logged")=="undefined"){
			localStorage.setItem("logged",0);}
			hide_show_loginButton();
	}
function hide_show_loginButton(){
		var vip1=document.getElementById("vip1");
		var vip2=document.getElementById("vip2");
		var vip3=document.getElementById("vip3");
		var vip4=document.getElementById("vip4");
		var logged=localStorage.getItem("logged");
		if(logged>0){		
			vip1.style.display="none";
			vip2.style.display="none";
			vip3.style.display="block";
			vip4.style.display="block";
			var v=localStorage.getItem("email"+logged);
			var arr=v.split("@");
			document.getElementById("vip31").innerHTML=""+arr[0];			
		}else{
			vip1.style.display="block";
			vip2.style.display="block";
			vip3.style.display="none";
			vip4.style.display="none";}
	}
function logout(){
		localStorage.setItem("logged",0);
		location.reload();
	}
function checkRegis() {
    alert("abc");
		for(var i=1;i<4;i++)
			document.getElementById("c"+i).innerHTML="";
		var mail_format=/^([a-zA-Z0-9_.-])+[@]+([\w]+[.])+([\w]+[.]*)+([\w])$/;
		var check=1;
		var usrquantity=localStorage.getItem("num_user");
		if(findID(document.regisform.email.value)>-1){
			document.getElementById("c1").innerHTML="This email has already been used";				
			check=0;}
		if(mail_format.test(document.regisform.email.value)==false){
			document.getElementById("c1").innerHTML="Wrong Email format";
			check=0;
		}
		if(document.regisform.password.value.length<8){
			document.getElementById("c2").innerHTML="At least 8 characters";
			check=0;
		}
		if(document.regisform.password.value!=document.regisform.password2.value){
			document.getElementById("c3").innerHTML="Passwords do not match";
			check=0;
		}
		if(check==0){
			dangki();
			return false;}
		register();
		alert("Đăng kí thành công");
		exitdangki();
		return true;
	}
function findID(sampMail){
		var quantity=localStorage.getItem("num_user");
		for(var i=1;i<=quantity;i++){
			var email=localStorage.getItem("email"+i);
			if(sampMail==email)
				return i;
		}
		return -1;
	}
function register(){
		var pass=document.regisform.password.value;
		var email=document.regisform.email.value;
		var quantity=localStorage.getItem("num_user");
		quantity++;
		localStorage.setItem("pass"+quantity,pass);
		localStorage.setItem("email"+quantity,email);
		localStorage.setItem("num_user",quantity);
	}
function login(){
		var mail_format=/^([a-zA-Z0-9_.-])+[@]+([\w]+[.])+([\w]+[.]*)+([\w])$/;
		document.getElementById("lg1").innerHTML="";
		document.getElementById("lg2").innerHTML="";
		var quantity=localStorage.getItem("num_user");
		var email=document.getElementById("emailx").value;
		var pass=document.getElementById("passx").value;
		var mailNum=findID(email);
		if(mail_format.test(document.lgform.email.value)==false){
			document.getElementById("lg1").innerHTML="Wrong Email format";
			dangnhap();
			return false;
		}
		if(mailNum==-1){			
			document.getElementById("lg1").innerHTML="Email does not exist";
			dangnhap();
			return false;}
		if(localStorage.getItem("pass"+mailNum)!=pass){
			
			document.getElementById("lg2").innerHTML="Incorrect password";
			dangnhap();
			return false;
		}else {
			localStorage.setItem("logged",mailNum);
			hide_show_loginButton();
			location.reload();}
	}
function showrasosp(){
	document.getElementById("xxxx").innerHTML=localStorage.getItem("product");
}