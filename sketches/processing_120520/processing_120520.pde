
size(400,565);//画像サイズ
smooth();//境目を滑らかにしています
background(#ffffe0);//クリーム色

stroke(#dcdcdc);//灰色
line(0,390,400,565);//円から出ている線↓ここから
line(0,390,400,545);
line(0,390,400,525);
line(0,390,400,505);
line(0,390,400,585);
line(0,390,400,605);
line(0,390,20,0);
line(0,390,40,0);
line(0,390,60,0);
line(0,390,80,0);
line(0,390,100,0);//ここまで

fill(0);//黒
rect(0,60,400,30);//たての棒
rect(130,0,40,565);//よこの棒

fill(#dc143c);//くすんだ赤
noStroke();//ふちどりなし
beginShape();//多角形
vertex(0,300);//ここから↓
vertex(100,300);
vertex(100,300);
vertex(200,200);
vertex(200,200);
vertex(200,300);
vertex(200,300);
vertex(300,300);
vertex(300,300);
vertex(200,400);
vertex(200,400);
vertex(200,500);
vertex(200,500);
vertex(400,300);
vertex(400,300);
vertex(400,200);
vertex(400,200);
vertex(500,100);
vertex(500,100);
vertex(400,100);
vertex(400,100);
vertex(400,0);
vertex(400,0);
vertex(300,100);
vertex(300,100);
vertex(200,100);
vertex(200,100);
vertex(0,300);//ここまで
endShape( CLOSE );//仕上げにこれで閉じる

fill(#dcdcdc);//灰色
noStroke();//縁取りなし
ellipse(60,450,250,250);円



