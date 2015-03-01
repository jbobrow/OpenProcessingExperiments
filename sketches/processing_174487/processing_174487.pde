
int x, y, k, g;//制御変数
int tim, tex;//時間制御変数
float a, b, c;//ランダム用変数

void setup() {//初期設定
  background(255 );
  size(500, 500);
  strokeWeight(200);
  fill(255);
  smooth();
  ellipse(250, 250, 650, 650);
  noStroke();
  frameRate(30);
  k=70;
  g=20;
  a=random(255 ); 
  b=random(255 ); 
  c=random(255 );
}


void draw() {
  tim++;
  tex++;
  if (tex==30) {
    tex=0;
  }
  if (mousePressed) { //マウスが押されたとき
    fill(a, b, c, 180);
    smooth() ;
    ellipse(mouseX, mouseY, g, g);
  }
  //---カウント-------------------
  if (tim < 30 && tim >= 0 ) {
    stroke(0);
    strokeWeight(200);
    noFill();
    smooth() ;
    ellipse(250, 250, 650, 650);
    noStroke();
  }
  if (tim < 2*30 && tim >= 30  ) {
    stroke(0);
    strokeWeight(200);
    noFill();
    smooth() ;
    ellipse(250, 250, 650, 650);
    noStroke();
    fill(0);
    rect(0, 0, k, k);
    fill(255);
    textSize(60-tex);
    text("5", 30, 70);
  }
  if (tim < 3*30 && tim >= 2*30  ) {
    stroke(0);
    strokeWeight(200);
    noFill();
    ellipse(250, 250, 650, 650);
    noStroke();
    smooth();
    fill(0);
    rect(0, 0, k, k);
    fill(255);
    textSize(60-tex);
    text("4", 30, 70);
  }
  if  (tim < 4*30 && tim >= 3*30  ) {
    stroke(0);
    strokeWeight(200);
    noFill();
    ellipse(250, 250, 650, 650);
    noStroke();
    smooth(); 
    fill(0);
    rect(0, 0, k, k);
    fill(255);
    textSize(60-tex);
    text("3", 30, 70);
  }
  if  (tim < 5*30 && tim >= 4*30  ) { 
    stroke(0);
    strokeWeight(200);
    noFill();
    ellipse(250, 250, 650, 650);
    noStroke();
    smooth(); 
    fill(0);
    rect(0, 0, k, k);
    fill(255);
    textSize(60-tex);
    text("2", 30, 70);
  }
  if (tim < 6*30 && tim >= 5*30  ) {
    stroke(0);
    strokeWeight(200);
    noFill();
    ellipse(250, 250, 650, 650);
    noStroke();
    smooth();
    fill(0);
    rect(0, 0, k, k);
    fill(255);
    textSize(60-tex);
    text("1", 30, 70);
  }
  if  (tim < 7*30 && tim >= 6*30  ) {
    stroke(0);
    strokeWeight(200);
    noFill();
    ellipse(250, 250, 650, 650);
    noStroke();
    smooth() ;
    fill(0);
    rect(0, 0, k, k);
    fill(255);
    textSize(60);
    text("0", 30, 70);
  }
  if (tim >= 7* 30 ) {
    stroke(0);
    strokeWeight(200);
    noFill();
    ellipse(250, 250, 650, 650);
    noStroke();
    smooth() ;
    a=random(255 ); 
    b=random(255 ); 
    c=random(255 );
    stroke(0);
    strokeWeight(200);
    fill(255, 255, 255, 150);
    ellipse(250, 250, 650, 650);
    noStroke();
    tim=30;
  }//-------------------------------
}

void keyPressed() {
  switch(key) { 
  case 'z': //zを押したとき
    background(255 );
    size(500, 500);
    strokeWeight(200);
    fill(255);
    ellipse(250, 250, 650, 650);
    smooth();
    noStroke();
    tim=0;
    tex=0;
    break;
  }
  if (key == CODED) {
    if (keyCode == UP) {  //↑を押したとき
      if (g<50) {
        g++;
      }
    } else if (keyCode == DOWN) {  //↓を押したとき
      if (g>3) { 
        g--;
      } else {
        g=3;
      }
    }
  }
}



