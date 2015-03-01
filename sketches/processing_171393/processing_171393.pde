
size(600,300);
background(255);


fill(0);
noStroke();
rect(300,0,300,300);//右側の背景色

//右側の変動部分の模様
int eSize=8; //四角形のサイズを8に設定
colorMode(HSB, 300);//カラーモードをHSBに変更
noStroke(); //線は書かない
for(int y = 0; y<=600; y+= 10){ 
for (int x=300; x<=600; x += 30) { 
  fill(20^y, 10^x, 5^x, 90^y); 
  rect(x,y,eSize,eSize);
  rect(10^x,10^y,eSize,eSize);
  rect(20^x,20^y,eSize,eSize);
  rect(92^x,100^y,eSize,eSize);
 
  
  
} 
}


//左側の模様
 
 fill(0);//一番右の黒い長方形
rect(270,0,30,300);
fill(100);//右から二番目の長方形
rect(240,40,30,220);
fill(125);//右から三番目の長方形
rect(210,80,30,150);
fill(200);//右から四番目の長方形
rect(180,120,30,90);
fill(260);//右から五番目の正方形
rect(150,150,30,30);
fill(0);//左から一番目の長方形
rect(0,0,30,300);
fill(100);//左から二番目の長方形
rect(30,40,30,220);
fill(125);//左から三番目の長方形
rect(60,80,30,150);
fill(200);//左から四番目の長方形
rect(90,120,30,90);
fill(260);//左から五番目の正方形
rect(120,150,30,30);


