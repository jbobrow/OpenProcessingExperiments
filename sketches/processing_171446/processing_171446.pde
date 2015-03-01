
size(600, 300);

int eSize = 100;

background(255);
smooth();
noStroke();
colorMode(RGB, 200);//カラーモードをRGBに変更
for (int i = 0; i < 300; i++) {
  for (int j = 0; j < 300; j++) {
    stroke(i, j, 150,250);
    point(i, j);//グラデーション位置（左）
  }
}



for (int x= 10; x <= 500; x+=60) {

  strokeWeight(2);

  stroke(200, 212, 255, x);


  noFill(); 
  strokeWeight(5);

  stroke(255, 255, 255, x); 
  ellipse(150, 150, x, x);//丸が60ずつ増加
}


noStroke();
colorMode(RGB, 255);
for (int i = 0; i < 300; i++) {
  for (int j = 0; j < 300; j++) {
    stroke(i, j, 150, 250);
    point(i+300, j);//グラデーション位置
  }
}

for (int y = 0; y<=300; y +=10) {
  for (int x =0; x<= 300; x += 10) {
    point(x,y);
    fill(50, y, 280, 350);
    ellipse(x+340, y, eSize, eSize);//円10ずつ増加
  }
}

for (int x= 10; x <= 500; x+=60) {

  strokeWeight(5);//線の太さ

  stroke(200, 212, 255, x);


  noFill(); 
  strokeWeight(5);//線の太さ

  stroke(150, 150, 150, x); 
  ellipse(x+300, 150, x, 250);//円右に60ずつ
}



