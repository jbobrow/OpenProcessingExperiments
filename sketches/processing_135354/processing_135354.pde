
PImage img;
 
Food f1, f2;
Player1 p1;
int timer = 0;
float fX = 100;
float fY = 100;
float eX = 200;
float eY = 200;
float pX = 300;
float pY = 300;
float easing = .4;
color pColor = color(#C8A5ED);
 
void setup() {
  size(700, 700);
  frameRate(24);
  img = loadImage("thegarden.png");
  f1 = new Food(200, 300, 92);
  f2 = new Food(100, 200, 92);
  p1 = new Player1(300, 300, .4);
}
void draw() {
  background(0);
  image (img, 0, 0);
  f1.display();
  f2.display();
  p1.display();
  food();
  player1();
  collisions();
}
 
void food() {
  //respawn
  timer++;
  if (timer >= 48) {
    fX = random(width);
    fY = random(height);
    timer = 0;
  }
  fill(#C8A5ED);
  ellipse(fX, fY, 30, 30);
}
 
 
 
void player1() {
  float targetX = mouseX;
  float targetY = mouseY;
  pX += (targetX - pX) * easing;
  pY += (targetY - pY) * easing;
  fill(pColor);
  ellipse(pX, pY, 30, 30);
}
 
void collisions() {
  float pDist = dist(pX, pY, fX, fY);
  if (pDist <= 30) {
    pColor = color(#FFFFFF);
  }
  else {
    pColor = color(#E894C6);
  }
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
    if (distance < 20) {
      fX = random(width);
      fY = random(height);
      timer = 0;
      println("collision");
    }
    fill(#C8A5ED);
    ellipse(fX, fY, 30, 30);
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
    fill(pColor);
    ellipse(pX, pY, 30, 30);
  }
}




