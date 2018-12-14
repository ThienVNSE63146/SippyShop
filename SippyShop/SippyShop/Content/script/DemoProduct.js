//ham nay de khoi tao bien count=0 trong local Storage

function khoitao()

{
	if (window.localStorage.getItem("count")==null)
		{
			window.localStorage.setItem("count",0);
		}
	if (window.localStorage.getItem("product")==null)
		{
			window.localStorage.setItem("product",0);
		}	
}

//ham nay de them mot sp vao localStorge
function myfind(macantim)
{
	
	
	var c= window.localStorage.getItem("count");
	if(c!=null)
	{
	for ( var i=0; i<c; i++)
		{
		var s=window.localStorage.getItem(i);
			if(s!=null)
				{
					var s_con=s.substring(0, s.indexOf(","));
					if(s_con.match(macantim)!=null)
						return i;
				}
		}
	}
	return -1;
}
function add(i)
{
	
	var pos=myfind(arrs[i].id);
	if(pos==-1) //khong tim thay
		{
			var c=window.localStorage.getItem("count");
			var d=window.localStorage.getItem("product");
			window.localStorage.setItem(c,arrs[i].id+","+arrs[i].name+","+arrs[i].image+","+arrs[i].price+",1");
			c++;
			d++;
			window.localStorage.setItem("count",c);
			window.localStorage.setItem("product",d);
			window.alert("Added product successful!!!");
		}
	else 
		window.alert("Product already exists!!!");
}

//ham nay de xuat data trong local.stogare vao div "d1" cua trang chitiet.html

function show()
{
	var sum=0;
	var sosp=0;
	var giamgia=0;
	var xong=0;
	var tx="<table class='pro'>";
	tx=tx+ "<tr class='vip'>";
	tx=tx+ "<th colspan='2' id='z1'>Sản phẩm trong giỏ hàng</th>";
	tx=tx+ "<th id='x3'>Đơn Giá</th>";
	tx=tx+ "<th id='x3'>Số lượng</th>";
	tx=tx+ "<th id='x3'>Thành tiền</th>";
	tx=tx+ "<th id='x5'></th>";
	tx=tx+ "</tr>";
	
	//lay datatrong local
	
	var c= window.localStorage.getItem("count");
	if (c!= null)
		{
			for (var i=0; i<c; i++)
				{
					var s=window.localStorage.getItem(i);
					if (s!=null)
						{
					var mang= s.split(",");
					tx= tx+ "<tr class='sanpham'>";
					tx= tx+ "<th id='x21'>"+"<img style='padding:10px;' src='"+mang[2]+"'/></th>";
					tx=tx+ "<th id='x22'>"+mang[1]+"<br> Mã SP: "+ mang[0]+ "<br>"
					tx = tx+ "<th id='x23'>"+ mang[3]+ " đ</th>";
					tx= tx+ "<th id='x24'><input type='number' min ='1' max='10' value='"+mang[4]+"' onchange='capnhat("+i+",this)'> </th>";
					tx = tx+ "<th id='x25'>"+ mang[3]*mang[4]+ " đ</th>";
					tx= tx+"<th id='x26'><img src='image/thungrac.png' id='hinhzz' onclick='xoa("+i+")'></th>";
					tx=tx+"</tr>";
					sum=sum+ mang[3]*mang[4];
					sosp = sosp + mang[4]*1;
						}
				}
			
		}
	tx=tx+"<tr class='dathang'>";
	tx=tx+"<td colspan='6'>";
	tx=tx+"<div style='float:left;text-align:left;padding-left:15px;padding-top:15px;cursor: pointer;' onClick='window.history.back();'>&#124;&larr; Continue bying</div>";
	tx=tx+"<a href='thongtinmuahang.html'><button style='float:right;margin-right:15px;cursor:pointer;' onclick()='' type='submit'>ĐẶT HÀNG</button></a>";
	tx=tx+"</td>";		
	tx=tx+"</tr>";		
	tx=tx+"</table>";
	var div= document.getElementById("d1");
	div.innerHTML=tx;
	if(window.localStorage.getItem("logged")==0){
		giamgia=0;
	}
	else{
		giamgia=5;
	}
	var xx="";
	xx=xx+"<p  style='margin-top:15px;'>Tổng sản phẩm <span style='float:right'>"+sosp+"</span></p>";
	xx=xx+"<p  style='margin-top:15px;'>Tổng tạm tính <span style='float:right'>"+sum+" VNĐ</span></p>";
	xx=xx+"<p  style='margin-top:15px;'>Giảm giá <span style='float:right'>"+giamgia+" %</span></p>";
	var div= document.getElementById("d2");
	div.innerHTML=xx;
	var zx="";
	xong=sum-sum*(giamgia*0.01);
	zx=zx+"<p  style='margin-top:15px;'> </p>";
	zx=zx+"<p  style='margin-top:15px;font-size:18px;'>Tổng Cộng <span style='float:right;color:red'>"+xong+" VNĐ</span></p>";
	var div= document.getElementById("d3");
	div.innerHTML=zx;
    window.localStorage.setItem("sosp",sosp);
	window.localStorage.setItem("sum",sum);
}
//show trong trang thong tin giao hang
function show2(){
	var kkk="";
	kkk=kkk+"<form action='index.html'  name='regisform2' method='post'>";
	kkk=kkk+"<table class='pro'>";
	kkk=kkk+ "<tr class='vip'>";
	kkk=kkk+ "<th colspan='6' id='x1'><b>ĐỊA CHỈ GIAO HÀNG</b></th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+ "<tr>";
	kkk=kkk+ "<th colspan='6'> </th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+ "<tr>";
	kkk=kkk+ "<th colspan='3' style='text-align:left;padding-left:35px;'>Họ tên</th>";
	kkk=kkk+ "<th colspan='3' style='text-align:left;padding-left:35px;'>Số điện thoại</th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+ "<tr>";
	kkk=kkk+ "<th colspan='3'><input type='text' name='name' placeholder='Họ tên người nhận' id='inputx'></th>";
	kkk=kkk+ "<th colspan='3'><input type='text' name='sdt' placeholder='Số điện thoại liên hệ' id='inputx'></th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+ "<tr>";
	kkk=kkk+ "<th colspan='6'> </th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+ "<tr>";
	kkk=kkk+ "<th colspan='3' style='text-align:left;padding-left:35px;'>Địa chỉ</th>";
	kkk=kkk+ "<th colspan='3' style='text-align:left;padding-left:35px;'>Thành Phố</th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+ "<tr>";
	kkk=kkk+ "<th colspan='3'><input type='text'  name='sonha' placeholder='Số nhà' id='inputx'></th>";
	kkk=kkk+ "<th colspan='3'><select style='width:350px;' id='inputx'><option value>Chọn Thành phố</option><option value='437'>Hồ Chí Minh</option><option value='440'>Hà Nội</option><option value='417'>An Giang</option><option value='419'>Bà Rịa Vũng Tàu</option><option value='421'>Bắc Giang</option><option value='420'>Bắc Kạn</option><option value='418'>Bạc Liêu</option><option value='422'>Bắc Ninh</option><option value='423'>Bến Tre</option><option value='424'>Bình Dương</option><option value='426'>Bình Phước</option><option value='427'>Bình Thuận</option><option value='490'>Bình Định</option><option value='430'>Cà Mau</option><option value='431'>Cần Thơ</option><option value='429'>Cao Bằng</option><option value='436'>Gia Lai</option><option value='438'>Hà Giang</option><option value='439'>Hà Nam</option><option value='441'>Hà Tây</option><option value='442'>Hà Tĩnh</option><option value='443'>Hải Dương</option><option value='444'>Hải Phòng</option><option value='510'>Hậu Giang</option><option value='446'>Hoà Bình</option><option value='447'>Huế</option><option value='513'>Hưng Yên</option><option value='514'>Khánh Hoà</option><option value='515'>Kiên Giang</option><option value='516'>Kon Tum</option><option value='452'>Lai Châu</option><option value='455'>Lâm Ðồng</option><option value='453'>Lạng Sơn</option><option value='519'>Lào Cai</option><option value='521'>Long An</option><option value='522'>Nam Ðịnh</option><option value='523'>Nghệ An</option><option value='459'>Ninh Bình</option><option value='525'>Ninh Thuận</option><option value='526'>Phú Thọ</option><option value='462'>Phú Yên</option><option value='463'>Quảng Bình</option><option value='464'>Quảng Nam</option><option value='465'>Quảng Ngãi</option><option value='531'>Quảng Ninh</option><option value='467'>Quảng Trị</option><option value='468'>Sóc Trăng</option><option value='534'>Sơn La</option><option value='536'>Tây Ninh</option><option value='537'>Thái Bình</option><option value='538'>Thái Nguyên</option><option value='539'>Thanh Hóa</option><option value='540'>Tiền Giang</option><option value='476'>Trà Vinh</option><option value='477'>Tuyên Quang</option><option value='543'>Vĩnh Long</option><option value='544'>Vĩnh Phúc</option><option value='545'>Yên Bái</option><option value='432'>Ðà Nẵng</option><option value='433'>Ðắc Lắc</option><option value='548'>Ðắk Nông</option><option value='499'>Ðồng Nai</option><option value='500'>Ðồng Tháp</option><option value='549'>Điện Biên</option></select</th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+ "<tr>";
	kkk=kkk+ "<th colspan='6'> </th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+ "<tr>";
	kkk=kkk+ "<th colspan='3' style='text-align:left;padding-left:35px;'>Đường</th>";
	kkk=kkk+ "<th colspan='3' style='text-align:left;padding-left:35px;'>Quận / Huyện</th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+ "<tr>";
	kkk=kkk+ "<th colspan='3'><input type='text' name='duong' placeholder='VD: Nguyễn Huệ' id='inputx'></th>";
	kkk=kkk+ "<th colspan='3'><input type='text' name='quan' placeholder='Tên Quận / Huyện' id='inputx'></th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+ "<tr>";
	kkk=kkk+ "<th colspan='6'> </th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+ "<tr>";
	kkk=kkk+ "<th colspan='3' style='text-align:left;padding-left:35px;'>Loại địa chỉ</th>";
	kkk=kkk+ "<th colspan='3' style='text-align:left;padding-left:35px;'>Phường / Xã</th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+ "<tr>";
	kkk=kkk+ "<th colspan='3'><select style='width:350px;' id='inputx'><option>Nhà riêng</option><option>Nơi làm việc</option></select</th>";
	kkk=kkk+ "<th colspan='3'><input type='text' name='phuong' placeholder='Tên Phường / xã' id='inputx'></th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+ "<tr>";
	kkk=kkk+ "<th colspan='6'> </th>";
	kkk=kkk+ "</tr>";
	kkk=kkk+"<tr class='dathang'>";
	kkk=kkk+"<td colspan='6'>";
	kkk=kkk+"<div style='float:left;text-align:left;padding-left:15px;padding-top:15px;cursor: pointer;' onClick='window.history.back();'>&#124;&larr; Continue bying</div>";
	kkk=kkk+"<button style='float:right;margin-right:15px;cursor:pointer;' id='submitres' onclick='return checkdonhang()' type='submit'>THANH TOÁN</button>";
	kkk=kkk+"</td>";		
	kkk=kkk+"</tr>";	
	kkk=kkk+"</table>";
	kkk=kkk+"</form>";
	var div= document.getElementById("d1");
	div.innerHTML=kkk;
	if(window.localStorage.getItem("logged")==0){
		giamgia=0;
	}
	else{
		giamgia=5;
	}
	var xx="";
	var sosp= window.localStorage.getItem("sosp");
	var sum= window.localStorage.getItem("sum");
	xx=xx+"<p  style='margin-top:15px;'>Tổng sản phẩm <span style='float:right'>"+sosp+"</span></p>";
	xx=xx+"<p  style='margin-top:15px;'>Tổng tạm tính <span style='float:right'>"+sum+" VNĐ</span></p>";
	xx=xx+"<p  style='margin-top:15px;'>Giảm giá <span style='float:right'>"+giamgia+" %</span></p>";
	var div= document.getElementById("d2");
	div.innerHTML=xx;
	var zx="";
	xong=sum-sum*(giamgia*0.01);
	zx=zx+"<p  style='margin-top:15px;'> </p>";
	zx=zx+"<p  style='margin-top:15px;font-size:18px;'>Tổng Cộng <span style='float:right;color:red'>"+xong+" VNĐ</span></p>";
	var div= document.getElementById("d3");
	div.innerHTML=zx;
}
//i la tri san pham cua so luong 
//x la the <input type='number'>
function capnhat(i,x)

{
	var s=window.localStorage.getItem(i);
	var mang=s.split(",");
	mang[4]= x.value;
	window.localStorage.setItem(i,mang[0]+","+mang[1]+","+mang[2]+","+mang[3]+","+mang[4]);
	show();
}

function xoa(i)
{
	window.localStorage.removeItem(i);
	var d=window.localStorage.getItem("product");
	d--;
	window.localStorage.setItem("product",d);
	show();
	
}
// hàm chạy slide show
var thuy=0;
var sc=screen.width; // lấy width của màn hình
function banner(){
	var tag=document.getElementById("bannertrong");
		tag.style.transform="translateX(-"+thuy+"px)";
		tag.style.transition="transform 1.5s";
		thuy=thuy+sc;
		if(thuy>=sc*3){
			thuy=0;}
		setTimeout("banner()",4000);	
} 
//ham nay de check cac thong tin trong thong tin giao hang
function checkdonhang(){
	var check=1;
		valid1 = /[a-z]/;
		valid2 = /[A-Z]/;
		valid3 = /[0-9]/;
		if(valid1.test(document.regisform2.name.value)==false){
			alert('NAME ERROR!!!');
			check=0;
		}
		if(valid3.test(document.regisform2.sdt.value)==false||document.regisform2.sdt.value.length<10||document.regisform2.sdt.value.length>11){
			alert('PHONE ERROR!!!');
			check=0;
		}
		if(valid3.test(document.regisform2.sonha.value)==false){
			alert('ADDRESS ERROR( House address!!!)');
			check=0;
		}
		if(valid1.test(document.regisform2.duong.value)==false){
			alert('ADDRESS ERROR (Street address!!!)');
			check=0;
		}
		if(valid1.test(document.regisform2.quan.value)==false){
			alert('ADDRESS ERROR (Distric address!!!)');
			check=0;
		}
		if(valid1.test(document.regisform2.phuong.value)==false){
			alert('ADDRESS ERROR (Town address!!!)');
			check=0;
		}
		if(check==1){
			alert('Order successful. We will contact you soon. THANK FOR SHOPPING');
			return true;
			}
		if(check==0){
			return false;
			}	
}