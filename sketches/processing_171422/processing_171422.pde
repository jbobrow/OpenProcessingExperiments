
int eSize = 5;

size(600, 300);
background(0);
colorMode(HSB, 300, 100, 100);



//背景（グラデーション）
for (int i=0; i<width; i++) {
  int x=300*i/width;    
  stroke(300-x);  
  line(i, 0, i, height);
}



//変動（四角）
for (int i=0; i<10; i++) {  //0から10までの四角を表示
  float x=random(300, 600);  //変数xに0から300のランダムな数値を代入
  float y=random(300);  //変数yに0から300のランダムな数値を代入
  float a=100;
  stroke(200);
  noFill();
  rect(x, y, a, a);
}



//変動（線）
for (int i=0; i<15; i++) {  //0から15までの線を表示
  float x=random(360);      //変数xにランダムで0から360の数値を代入
  stroke(x, 100, 100);
  strokeWeight(2);
  //y座標は0と300で固定。x座標のrandom(300)は0から300の少数
  line(random(300)+300, 0, random(300)+300, 300);
}



//変動（横線）
//iは0から始まって60の間隔をあけながらヨコ線を表示していく
for (int i=0; i<width; i+=60) {
  stroke(255);
  strokeWeight(2);
  line(i, i, 600, i);
}



//安定（四角）
//iは0から始まり、縦に30ずつずらしながら四角を表示
for (int i=0; i<height; i++) {
  fill(0, 0, 300, 100);
  rect(0, (30+i)*i, 40, 40);
}

for (int i=0; i<height; i++) {
  fill(0, 0, 300, 100);
  rect(60, (30+i)*i, 40, 40);
}

for (int i=0; i<height; i++) {
  fill(0, 0, 300, 100);
  rect(120, (30+i)*i, 40, 40);
}

for (int i=0; i<height; i++) {
  fill(0, 0, 300, 100);
  rect(180, (30+i)*i, 40, 40);
}

for (int i=0; i<height; i++) {
  fill(0, 0, 300, 100);
  rect(240, (30+i)*i, 40, 40);
}



