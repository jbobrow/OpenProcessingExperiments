
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Hyeri Jeong
// ID: 201420107 Hyeri Jeong


float xW = 25;
float direction = 5;
float x=160;
float y=160;
float xSpeed=2;
float ySpeed=1;
float r=200;
float angle;
PFont font;


void setup() {
  size (600, 600);
  smooth();
}

void draw() {
  noStroke();
  fill(255);
  rect(0, 0, width, height); 

  for (int i = 80; i < width-25; i = i + 50) {
    for (int j = 80; j < height-25; j = j + 50) {

      stroke(150);
      strokeWeight(xW/2);
      noFill();
      ellipse(i, j, xW, xW);
    }

    pushMatrix();
    translate(x, y);
    rotate(angle);
    noStroke();
    fill(0);
    ellipse(0, 0, r, r);
    textAlign(CENTER, CENTER);
    textSize(28);
    fill(255);
    text("Dynamic Media", 0, 0);
    popMatrix();
    x=x+xSpeed;
    y=y+ySpeed;
    angle+=0.01;

    if ((x<0+r/2) || (x>width-r/2)) {
      xSpeed = xSpeed * -1;
    }

    if ((y<0+r/2) || (y>height-r/2)) {
      ySpeed = ySpeed * -1;
      if ((x<0+r/2) || (x>width-r/2)) {
        xSpeed = xSpeed * -1;
      }
    }
  } 

  xW = xW + direction;

  if (xW > 100) {
    direction = direction * -1;
  }
  if (xW < 1) {
    direction = direction * -1;
  }
}

