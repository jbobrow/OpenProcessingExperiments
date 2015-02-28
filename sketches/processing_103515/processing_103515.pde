
//import java.util.*;

int n = 1000;
Butterfly[] b = new Butterfly[n];

class Butterfly {
  float x;
  float y;
  float speedX;
  float speedY;
  float accX;
  float accY;
  float red = 0;
  float blue = 100;

  Butterfly() {
    x = random(0, width);
    y = random(0, height);
    speedX = random(-2.0, 2.0);
    speedY = random(-2.0, 2.0);
  }

  void display(int col) {
    stroke(0);
    strokeWeight(0);
    fill(red, col, blue);
    ellipse(x, y, 8, 8);
  }

  void moverandom() {
    speedX = speedX + random(-.1, .1);
    speedY = speedY + random(-.1, .1);
    if (speedX > 5.0) speedX = 5.0;
    if (speedX < -5.0) speedX = -5.0;
    if (speedY > 5.0) speedY = 5.0;
    if (speedY < -5.0) speedY = -5.0; 
    x = (x + speedX);
    y = (y + speedY);
    //fall down
    speedY = speedY + .05;
    if (speedX > 0) speedX = speedX - .02;
    if (speedX < 0) speedX = speedX + .02;
    if (speedY > 0) speedY = speedY - .02;
    if (speedY < 0) speedY = speedY + .02;
    if (x>width) {speedX = -speedX; x = width -2;}
    if (x<0) {speedX = -speedX; x = 1;}
    if (y>height) {speedY =-speedY - 0.2; y = height -3;}
    if (y<0) {speedY = -speedY; y = 1;}
  }
  
  void accelerateTo(float rx, float ry) {
    accX = mouseX - pmouseX;
    accY = mouseY - pmouseY;//ry - y;
    speedX = speedX + accX;
    speedY = speedY + accY;
    red = (red + 1) % 255;
  }
}


void setup() {
  size(500, 500);
  for (int i=0; i<b.length; i++) { 
    b[i] = new Butterfly();
  }
  noStroke();
  smooth();
  background(255);
}

boolean closeCreatures(float rX, float rY, int i) {  // is b[i] close to b[j]
  float dist = sqrt(sq(b[i].x - rX) + sq(b[i].y - rY));
  if (dist < random(20.0, 30.0)) return true;
  else return false;
}

void mouseDragged() {
  //fill(255, 0, 0);
  //ellipse(mouseX, mouseY, 5, 5);
  accelerateToMouseDragged(mouseX,mouseY);
}

void accelerateToMouseDragged(float rx, float ry) {
  for (int i = 0; i<b.length; i++) {
    if (closeCreatures(rx, ry, i) == true) 
      b[i].accelerateTo(rx, ry); 
  }
}

void draw() {
  background(255);
  for (int i=0; i<b.length; i++) {
    b[i].display((i)%255);
    b[i].moverandom();
  }
}



