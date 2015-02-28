
PImage img1;
PShape s;
 
Food f1, f2;
Player1 p1;
 
color pColor = color(#FFFFFF);
 
void setup() {
  size(600, 600);
  frameRate(24);
  img1 = loadImage("hasbkgd.png");
  s = loadShape("spriteplay.svg");
  smooth();
  noStroke();
  f1 = new Food(200, 300, 80);
  f2 = new Food(100, 200, 80);
  p1 = new Player1(300,300,.10);
   
}
 
void draw() {
  background(0);
  image(img1,0,0);
  f1.display();
  f2.display();
  p1.display();
}
 
class Food {
  int timer = 0;
  float fX;
  float fY;
  int respawn;
 
  Food(float tempX, float tempY, int tempTime) {
    fX = tempX;
    fY = tempY;
    respawn = tempTime;
  }
 
  void display() {
    timer++;
    if (timer >= respawn) {
      fX = random(width);
      fY = random(height);
      timer = 0;
    }
  float distance = dist(p1.pX, p1.pY, fX, fY);
    if(distance < 23){
      fX = random(width);
      fY = random(height);
      timer = 0;
      println("tag!");
  }
    fill(#009900);
    ellipse (fX, fY, 30, 30);
}
}
class Player1 {
  float pX;
  float pY;
  float easing;
 
  Player1(float tempX, float tempY, float tempEasing) {
    pX = tempX;
    pY = tempY;
    easing = tempEasing;
  }
 
  void display() {
    float targetX = mouseX;
    float targetY = mouseY;
    pX += (targetX - pX) * easing;
    pY += (targetY - pY) * easing;
    fill(#FF0000);
    stroke(1);
    fill(pColor);
    ellipse(pX, pY, 30, 30);
  }
}


