
size(600, 300); //ウィンドウのサイズ


int eSize = 13; //四角形のサイズ
colorMode(RGB); //カラーモードをRGBに変更
background(150,120,130); //背景の色を変更
noStroke(); //線を描かない

for(int x=0; x<=300; x+=10){ //300まで10px事に繰り返す
for(int y=0; y<=300; y+=10){ //300まで10px事に繰り返す
  fill(200, x, 146); //色を変更
  rect(y, x, eSize, eSize);
  smooth(); //綺麗に描く
 }
}


fill(#d66a35);  //色変更
noStroke(); //線を描かない
ellipse(150, 150, 300, 300); //円を描く

fill(#db8449);
ellipse(150, 150, 290, 290);

fill(#dd7a56);
ellipse(150, 150, 280, 280);

fill(#e17b34);
ellipse(150, 150, 270, 270);

fill(#e45e32);
ellipse(150, 150, 260, 260);

fill(#e49e61);
ellipse(150, 150, 250, 250);

fill(#eb6101);
ellipse(150, 150, 240, 240);

fill(#ea5506);
ellipse(150, 150, 230, 230);

fill(#ea5506);
ellipse(150, 150, 220, 220);

fill(#eb6238);
ellipse(150, 150, 210, 210);

fill(#ee7800);
ellipse(150, 150, 200, 200);

fill(#ec6800);
ellipse(150, 150, 190, 190);

fill(#ec6800);
ellipse(150, 150, 180, 180);

fill(#ed6d3d);
ellipse(150, 150, 170,170);

fill(#ee7948);
ellipse(150, 150, 160, 160);

fill(#ec6d51);
ellipse(150, 150, 150, 150);

fill(#f08300);
ellipse(150, 150, 140, 140);

fill(#f39800);
ellipse(150, 150, 130, 130);

fill(#f6ad49);
ellipse(150, 150, 120, 120);

fill(#f8b862);
ellipse(150, 150, 110, 110);

fill(#a0d8ef);
ellipse(150, 150, 100, 100);

fill(#89c3eb);
ellipse(150, 150, 90, 90);

fill(#84a2d4);
ellipse(150, 150, 80, 80);

fill(#83ccd2);
ellipse(150, 150, 70, 70);

fill(#84b9cb);
ellipse(150, 150, 60, 60);

fill(#698aab);
ellipse(150, 150, 50, 50);

fill(#008899);
ellipse(150, 150, 40, 40);

fill(#00a3af);
ellipse(150, 150, 30, 30);

fill(#2a83a2);
ellipse(150, 150, 20, 20);

fill(#59b9c6);
ellipse(150, 150, 10, 10);

fill(0);
ellipse(150, 150, 5, 5);


stroke(#ffd900); //線の色を変更
strokeWeight(2); //線の太さを変更
fill(#bbbcde,200); //色を変更
ellipse(0, 190, 40, 40); //円を描く

fill(#c3d825,200);
ellipse(25, 200, 40, 40);

fill(#d7003a,200);
ellipse(55, 220, 40, 40);

fill(#674196,200);
ellipse(75, 240, 40, 40);

fill(#68be8d,200);
ellipse(95, 260, 40, 40);

fill(#00a381,200);
ellipse(105, 280, 40, 40);

fill(#ee827c,200);
ellipse(115, 300, 40, 40);

fill(#c9171e,170);
ellipse(0,300, 200, 200);


stroke(#e2041b); //線の色
strokeWeight(2); //線の太さ

rectMode(CENTER); //x yを中心に
fill(#dccb18,150); //色変更
translate(500,150); //x,y座標軸を移動


translate(100,0); //座標を移動
rotate(radians(60)); //座標軸を回転
fill(#c1e4e9); //円の色を変更
ellipse(0,0,150,150); //円を描く

rotate(radians(60));
translate(100,0);
fill(#ffec47);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#7058a3);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#f39800);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#19448e);
ellipse(0,0,150,150);



translate(100,50);
rotate(radians(60));
fill(#c1e4e9);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#3eb370);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#ffec47);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#7058a3);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#f39800);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#19448e);
ellipse(0,0,150,150);




translate(100,100);
rotate(radians(60));
fill(#d7003a);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#3eb370);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#884898);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#7058a3);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#f39800);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#19448e);
ellipse(0,0,150,150);



translate(100,200);
rotate(radians(60));
fill(#c1e4e9);
ellipse(0,0,150,150);


rotate(radians(60));
translate(100,0);
fill(#f39800);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#19448e);
ellipse(0,0,150,150);

translate(100,250);
rotate(radians(60));
fill(#19448e);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#00a3af);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#674196);
ellipse(0,0,150,150);




translate(150,150);
rotate(radians(60));
fill(#e60033);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#e60033);
ellipse(0,0,150,150);

rotate(radians(60));
translate(100,0);
fill(#e60033);
ellipse(0,0,150,150);




