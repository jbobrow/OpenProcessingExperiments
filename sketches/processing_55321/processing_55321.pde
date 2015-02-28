
String moji = "八雲式電脳幻影術";
int len = moji.length();
int angle = 360 / len;
int radius = 50;
int theta;
float alp;

int rect_theta;
int rect_size =100;

PFont mahou;

void setup() {
  size(350, 350);
  background(0);
  smooth();

  mahou = loadFont("mahou.vlw");

  textAlign(CENTER);
}

void draw() {
  background(0);
  mahoujin();
  danmaku();
}


void mahoujin() {
  pushMatrix();

  translate(width/2, height/2);

  textFont(mahou);
  textSize(40);  

  for (int i = 0; i  < 8; i++) {
    pushMatrix();
    rotate(radians(i * angle));
    translate(radius*1.8, 0);
    rotate(radians(90));
    fill(240, 46, 46);
    text(moji.charAt(i), 0, 0);
    popMatrix();
  }

  rectMode(CENTER);
  noFill();
  strokeWeight(5);
  stroke(240, 46, 46, 250*abs(sin(alp)));
  rect(0, 0, rect_size, rect_size);

  pushMatrix();
  rotate(radians(rect_theta));
  rect(0, 0, rect_size, rect_size);
  popMatrix();

  pushMatrix();
  for (int j = 0;j < 4;j++) {
    rotate(radians(45*j));
    ellipse(0, 0, 80, 30);
  }
  popMatrix();

  ellipse(0, 0, 130, 130);
  ellipse(0, 0, 150, 150);

  ellipse(0, 0, 260, 260);

  strokeWeight(10);
  ellipse(0, 0, 280, 280);

  rect_theta += 2;

  alp += 0.025;
}

void danmaku() {
  for (int i = 0;i <= 150;i++) {
    if (i % 2 == 0) {
      noFill();
    }
    else {
      fill(224, 124, 255, 150);
    }
    noStroke();
    ellipse(i*cos(theta), i*sin(theta), theta, theta);
    theta++;
    if (theta > 50) {
      theta = 0;
    }
  }
  popMatrix();
}


