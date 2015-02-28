
void setup() {
  size(450, 530);
  background(255);

  smooth();
}

void draw() {
  background(255);

  r_hand();

  noStroke();
  body();
  neck();
  head();
}

void r_hand() {
  stroke(64);
  strokeWeight(40);
  noFill();
  bezier(200, 230, -50, 300, 200, 150, 50, 60);
}

void neck() {
  fill(64);
  rect(210, 150, 80, 50);
  ellipse(250, 200, 80, 30);
}

void body() {
  //タイヤ
  fill(13);
  ellipse(250, 450, 70, 120);
  ellipse(170, 390, 40, 90);
  ellipse(330, 390, 40, 90);

  //体
  fill(127);
  ellipse(250, 300, 250, 300);

  //パネル
  fill(23, 55, 94);
  rect(190, 240, 120, 70);
  fill(0, 255, 0);
  ellipse(210, 260, 20, 20);
  ellipse(240, 260, 20, 20);
  rect(255, 275, 50, 10);
  rect(255, 290, 50, 10);
}

void head() {
  //水色耳
  pushMatrix();
  translate(350, 90);
  fill(49, 133, 156);
  rotate(radians(45));
  ellipse(0, 0, 40, 150);
  popMatrix();

  pushMatrix();
  translate(150, 90);
  fill(49, 133, 156);
  rotate(radians(-45));
  ellipse(0, 0, 40, 150);
  popMatrix();

  //青耳
  fill(31, 73, 125);
  ellipse(340, 110, 50, 80);
  ellipse(160, 110, 50, 80);

  //顔
  fill(127);
  ellipse(250, 100, 200, 150);

  //目
  fill(31, 73, 125);
  r_eye(260, 180);
  l_eye(220, 52);
}

void r_eye(int x, int y) {
  pushMatrix();
  rotate(radians(-15));
  quad(x, y, x+42, y-25, x, y-25, x-42, y);
  //popMatrix();
}

void l_eye(int x, int y) {
  //pushMatrix();
  rotate(radians(30));
  quad(x, y, x-42, y-25, x, y-25, x+42, y);
  popMatrix();
}


