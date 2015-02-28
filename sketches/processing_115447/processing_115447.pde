
int x, y;
int vx;
int walk; //0-1-2-1
int eat; //1~4
int ty;
int stat; //0=walk 1=eat 2=thank you
int count ;


void setup() {
  size(600, 200);
  x=0;
  y=height/2;
  vx=4;
  walk = 0;
}

void draw() {
  background(0, 250, 250);
  chara(x, y-57);

  if (stat == 0) {
    x=x+vx;
    if (x >=width) x = 0;

    if (frameCount%40 < 10) walk = 0;
    else if ((frameCount%40 > 10)&&(frameCount%40 < 20)) walk = 1;
    else if ((frameCount%40 > 20)&&(frameCount%40 < 30)) walk = 2;
    else walk =1;
  }

  else if (stat == 1) {
    background(0, 250, 250);
    chara_eat(x, y-57);

    if (frameCount%60 < 10) eat = 0;
    else if ((frameCount%60 > 10)&&(frameCount%60 < 20)) eat = 1;
    else if ((frameCount%60 > 20)&&(frameCount%60 < 30)) eat = 2;
    else if ((frameCount%60 > 30)&&(frameCount%60 < 40)) eat = 3;
    else if ((frameCount%60 > 40)&&(frameCount%60 < 50)) eat = 4;

    count = count - 1 ;
    if (count == 0) stat = 0 ;
  }

  else if (stat == 2) {
    background(0, 250, 250);
    chara_ty(x, y-57);

    if (frameCount%40 < 10) ty = 0;
    else if ((frameCount%40 > 10)&&(frameCount%40 < 20)) ty = 1;
    else if ((frameCount%40 > 20)&&(frameCount%40 < 30)) ty = 2;
    else ty =1;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) stat = 0;
  else if (mouseButton == RIGHT) {
    stat = 1;
    count = 60 ;
    frameCount = 0;
  }
}

void keyPressed() {
  if (key == 'a') stat = 2;
}


void apple(int a, int b) {

  pushMatrix();
  translate(a, b);

  //mi
  stroke(255, 0, 0); 
  fill(255, 0, 0);
  ellipse(0, 0, 30, 30);

  fill(255);
  noStroke();
  if (eat == 1 ) ellipse(-10, 0, 15, 15);
  else if(eat == 2) {
    ellipse(-10, 0, 15, 15);
    ellipse(-5,5,20,20);
  }
  

  //kuki
  stroke(100, 65, 65);
  strokeWeight(3);
  line(0, -10, 0, -20);

  popMatrix();
}


void chara(int a, int b) {

  pushMatrix();
  translate(a, b);

  noStroke();

  //ashi_oku
  fill(0);
  pushMatrix();
  translate(30,120);
  if(walk == 0) rotate(PI/6);
  else if(walk == 1) rotate(0);
  else if(walk == 2) rotate(PI/-6);
  rect(0, 0, 20, 40, 10);
  popMatrix();

  //ude_oku
  pushMatrix();
  translate(60,80);
  if(walk == 0) rotate(PI/-6);
  else if(walk == 1) rotate(0);
  else if(walk == 2) rotate(PI/6);
  rect(0, 0, 15, 30, 10);
  popMatrix();

  //body
  fill(255);
  ellipse(25, 105, 20, 20); //shippo
  rect(25, 65, 45, 50, 5);
  ellipse(53, 105, 60, 50);

  //ashi
  fill(0);
  pushMatrix();
  translate(40, 120);
  if(walk == 0) rotate(PI/-8);
  else if(walk == 1) rotate(0);
  else if(walk == 2) rotate(PI/8);
  rect(0, 0, 20, 40, 10);
  popMatrix();

  //head
  ellipse(25, 30, 35, 30);
  ellipse(65, 27, 30, 25);
  fill(255);
  ellipse(50, 50, 70, 60);
  
  //ude
  fill(0);
  pushMatrix();
  translate(30,80);
  if(walk == 0) rotate(PI/6);
  else if(walk == 1) rotate(0);
  else if(walk == 2) rotate(PI/-6);
  else if(ty == 0) rotate(PI/1.3);
  else if(ty == 1) rotate(PI/1);
  else if(ty == 2) rotate(PI/0.3);
  rect(0, 0, 15, 30, 10);
  popMatrix();

  //me
  //hidarime
  pushMatrix();
  translate(45, 50);
  rotate(PI/6);
  ellipse(0, 0, 15, 25);
  popMatrix();

  //migime
  pushMatrix();
  translate(70, 50);
  rotate(PI/-6);
  ellipse(0, 0, 15, 25);
  popMatrix();

  popMatrix();
}


void chara_eat(int a, int b) {

  pushMatrix();
  translate(a, b);

  noStroke();

  //ashi_oku
  fill(0);
  pushMatrix();
  translate(30, 120);
  rect(0, 0, 20, 40, 10);
  popMatrix();

  //ude_oku
  pushMatrix();
  translate(60, 80);
  if (eat == 0 || eat ==1 || eat == 2 || eat == 3) rotate(PI/-1.8);
  else if(eat == 4) rotate(0);
  rect(0, 0, 15, 30, 10);
  popMatrix();

  //body
  fill(255);
  ellipse(25, 105, 20, 20); //shippo
  rect(25, 65, 45, 50, 5);
  ellipse(53, 105, 60, 50);

  //ashi
  fill(0);
  pushMatrix();
  translate(40, 120);
  rect(0, 0, 20, 40, 10);
  popMatrix();

  //head
  ellipse(25, 30, 35, 30);
  ellipse(65, 27, 30, 25);
  fill(255);
  ellipse(50, 50, 70, 60);

  //me
  //hidarime
  pushMatrix();
  fill(0);
  translate(45, 50);
  rotate(PI/6);
  ellipse(0, 0, 15, 25);
  popMatrix();

  //migime
  pushMatrix();
  translate(70, 50);
  rotate(PI/-6);
  ellipse(0, 0, 15, 25);
  popMatrix();


  //apple
  if (eat == 0 || eat == 1 || eat == 2) apple(80, 60);
  else {
  }


  //ude
  fill(0);
  stroke(0);
  pushMatrix();
  translate(30, 80);
  if (eat == 0 || eat == 1 || eat == 2 || eat == 3) {
    translate(13, 0);
    rotate(PI/-1.8);
  }
  else if(eat == 4) rotate(0);
  rect(0, 0, 15, 30, 10);
  popMatrix();

  popMatrix();
}


void chara_ty(int a, int b) {

  pushMatrix();
  translate(a, b);

  noStroke();

  //ashi_oku
  fill(0);
  pushMatrix();
  translate(30, 120);
  rect(0, 0, 20, 40, 10);
  popMatrix();

  //ude_oku
  pushMatrix();
  translate(60, 80);
  rect(0, 0, 15, 30, 10);
  popMatrix();

  //body
  fill(255);
  ellipse(25, 105, 20, 20); //shippo
  rect(25, 65, 45, 50, 5);
  ellipse(53, 105, 60, 50);

  //ashi
  fill(0);
  pushMatrix();
  translate(40, 120);
  rect(0, 0, 20, 40, 10);
  popMatrix();

  //head
  ellipse(25, 30, 35, 30);
  ellipse(65, 27, 30, 25);
  fill(255);
  ellipse(50, 50, 70, 60);

  //ude
  fill(0);
  pushMatrix();
  translate(30, 80);
  if (ty == 0 || ty == 1 || ty == 2) {
    translate(15, 0);
    textSize(30);
    text("< Thank you for your attention!!", 50, -50); // 表示するテキスト, x座標, y座標
    if (ty == 0) rotate(PI/1.3);
    else if (ty == 1) rotate(PI/1);
    else if (ty == 2) rotate(PI/0.3);
  }
  rect(0, 0, 15, 30, 10);
  popMatrix();

  //me
  //hidarime
  pushMatrix();
  translate(45, 50);
  rotate(PI/6);
  ellipse(0, 0, 15, 25);
  popMatrix();

  //migime
  pushMatrix();
  translate(70, 50);
  rotate(PI/-6);
  ellipse(0, 0, 15, 25);
  popMatrix();

  popMatrix();
}



