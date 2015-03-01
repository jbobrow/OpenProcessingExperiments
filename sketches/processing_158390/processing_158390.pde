
import processing.opengl.*;

float x;
float y;

float pX;
float pY;
float pc1;
float pc2;

float qX;
float qY;
float qc1;
float qc2;

float sw = 0;
float a = 0;

float varC;
float t = 0;


void setup() {
  size(400, 400, OPENGL);
  background(255);
  x = width/2;
  y = height/2;
  a = 0;
  smooth()
 // frameRate(10);
}

void draw() {
  t+= 0.1;
  varC = (sin(t)+1)*128;
  println(varC);

  pc1 = map(x, width, 0, -40, 40);
  pc2 = map(y, height, 0, -40, 40);

  pX = x;
  pY = y;
  qX = x + random(-100, 100);
  qY = y + random(-40, 40);
  x += random(-20, 20);
  y += random(-20, 20);
  strokeWeight(2+sw);
  stroke(0, 0, 0, 180+a);
  line(pX, pY, x, y);
  strokeWeight(1);
  stroke(240+pc1, 240+pc2, 0, 180+a);
  line(qX, qY, x+20, y+20);
  stroke(0, 190+pc2, 190+pc1, 100+(a/2));
  line(qY, qX, x+20, y+20); 

  if (x < 0 || x > width || y < 0 || y > height) {
    a += 10;
    sw += 0.2f;
    fill(255, 255, 255, 50);
    rectMode(CENTER);
    rect(width/2, height/2, 800, 800);
    pushMatrix();
    rotate(-PI/4);
    popMatrix();
    x = random(0, width);
    y = random(0, height);
  }
}

void mousePressed() {
}

