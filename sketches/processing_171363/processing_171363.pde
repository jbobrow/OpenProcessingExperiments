
int eSize = 40; //円の直径


size(600, 300);
colorMode(RGB, 400);
background(400);
noStroke();

fill(#58D1FF);//左側　安定 水色
rect(0, 0, 300, 300);

stroke(#056C22);//緑
strokeWeight(5);

int kannkaku = 0;

for (int j = 0; j < 15; j ++) {
  for (int i = 0; i < 7; i++) {

    line(i * 80 + 60, j * 40, i * 80 + 60, j * 40 + 56);
  }
}

kannkaku = 0;
stroke(#0E5808);//緑
strokeWeight(5);
for (int j = 0; j < 15; j ++) {
  for (int i = 0; i < 13; i++) {
    line(j * 40 + kannkaku, 40 + i * 80, (j + 1) * 40 +kannkaku, 40 + i * 80);
  }
}//繰り返しを使って丸を並べてる




fill(#07F1F7);//水色
for (int j=0; j<5; j++) {
  for (int i=0; i<4; i++) {
    ellipse(i * 80 + 20, j * 80, eSize, eSize);
  }
}


fill(#0C8589, 200);//緑と水色の間の色
for (int j=0; j<5; j++) {
  for (int i=0; i<4; i++) {

    noStroke(); 
    ellipse(i * 80 + 20, j * 80, 25, 25 );
  }
}

fill(#FA0A9A, 110);//ピンク
for (int j=0; j<5; j++) {
  for (int i=0; i<4; i++) {

    noStroke(); 
    ellipse(i * 80 + 20, j * 80, 15, 15 );
  }
}

stroke(#F2B227);//　黄色
strokeWeight(10);
fill(#FF2E32);//右側　変動 　赤
rect(300, 0, 400, 600);

line(350, 0, 400, 300);
line(300, 300, 600, 0);
line(570, 0, 500, 300);
line(580, 300, 390, 220);
line(330, 10, 500, 90);
line(300, 80, 365, 100);
line(300, 150, 365, 100);


fill(#DD27F2, 300);
ellipse(500, 50, 70, 70);// ピンク

fill(#2E3AFF, 200);
ellipse(355, 200, 50, 50);//紫

fill(#00EFFA, 350);
ellipse(440, 205, 60, 60);//水色

fill(#67FF5D);
ellipse(330, 10, 30, 30);//緑

fill(#FFD95D);
ellipse(350, 280, 40, 40);//黄色

fill(#0700FF, 310);
ellipse(590, 55, 50, 50);//紺色

fill(#480D09);
ellipse(573, 235, 100, 100);//茶色


fill(#FF6600);
ellipse(420, 110, 90, 90);//オレンジ


noStroke();//strokeなしの透明度が高い円
fill(#DD27F2, 200);
ellipse(500, 50, 70, 70);//ピンク
fill(#FC2424, 200);
ellipse(500, 50, 50, 50);//赤

fill(#2E3AFF, 100);
ellipse(355, 200, 50, 50);//紫
fill(#E103FF, 100);
ellipse(355, 200, 30, 30 );//紫

fill(#00EFFA, 250);
ellipse(440, 205, 60, 60);//水色
fill(#2597F2, 250);
ellipse(440, 205, 40, 40);//濃い水色


fill(#67FF5D, 250);
ellipse(330, 10, 30, 30);//黄緑
fill(#068E1F, 250);
ellipse(330, 10, 10, 10);//緑


fill(#F08827, 100);
ellipse(350, 280, 40, 40);//黄色
fill(#FFB003);
ellipse(350, 280, 20, 20);//オレンジ

fill(#0700FF, 250);
ellipse(590, 55, 50, 50);//紺色

fill(#480D09, 250);
ellipse(573, 235, 100, 100);//茶色
fill(#950808, 250);
ellipse(573, 235, 80, 80);//バーガンディ

fill(#FF6600, 200);
ellipse(420, 110, 90, 90);//オレンジ
fill(#FFEE31, 200);
ellipse(420, 110, 70, 70);//黄色


