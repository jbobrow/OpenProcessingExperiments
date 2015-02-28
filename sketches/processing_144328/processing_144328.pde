
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: AN Junyeong
// ID: 201420088

float x, y;

void setup() {
  size(600, 600);
  smooth();
  x = width/2;
  y = height/2;
}

void draw() {
  background(0);
  someThing();
}

void someThing() {
  noStroke();

  fill(#013107);
  rect(0, 0, 600, 600);

  fill(#97C634);
  rect(20, 20, 560, 560);
  rect(0, 0, 20, 20);
  rect(0, 580, 20, 20);
  rect(580, 0, 20, 20);
  rect(580, 580, 20, 20);
  fill(#DADE24);
  rect(45, 45, 510, 510);
  fill(#DB6921);
  rect(70, 70, 460, 460);
  fill(#97C634);
  rect(95,95,410,410);
  fill(#DB6921);
  rect(120,120,360,360);
  fill(#DADE24);
  rect(145,145,310,310);
  fill(#97C634);
  quad(300, 70, 530, 300, 300, 530, 70, 300);
  fill(#DADE24);
  rect(185,185,230,230);
  
  float s = second()*10;
  pushMatrix();
  translate(x, y);
  rotate(s);
  noStroke();
  fill(255);
  rect(100, 0, 40, 40);
//  textSize(20);
//  fill(0);
//  text(second(), 109, 28);
  popMatrix();

  float h = hour()*60;
  pushMatrix();
  translate(x, y);
  rotate(h);
  noStroke();
  fill(#076A40);
  rect(150,50, 100, 100);
  textSize(75);
  fill(255);
  text(hour(),173,125);
  popMatrix();
  
  float m = minute()*30;
  pushMatrix();
  translate(x, y);
  rotate(m);
  noStroke();
  fill(#27426F);
  rect(-200, -200, 80, 80);
  textSize(50);
  fill(255);
  text(minute(), -188, -143);
  popMatrix();
}
