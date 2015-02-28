
Car myCar;
Grape newGrape;

void setup() {
  size(500, 500);
  myCar = new Car();
  newGrape = new Grape();
}
void draw() {
  background(255);
  //
  newGrape.display();
  myCar.display();
  myCar.move();
  //
  if (rectangle_collision (myCar.xpos, myCar.ypos, myCar.sizeW, myCar.sizeH, 
  newGrape.xpos, newGrape.ypos, newGrape.sizeW, newGrape.sizeH)) {  
    // println ("hit");
    newGrape = new Grape();
  }
}
//
boolean rectangle_collision(float carX, float carY, float carW, float carH, 
float grapeX, float grapeY, float grapeW, float grapeH)
// from PhiLho
{
  return (grapeX + grapeW/2 < carX + carW/2 && 
          grapeX - grapeW/2 > carX - carW/2 && 
          grapeY + grapeW/2 < carY + carW/2 && 
          grapeY - grapeW/2 > carY - carW/2);
}
// =========================================================
void keyPressed() {
  int k = keyCode;
  if (k == ENTER | k == RETURN)
    myCar.speed = myCar.speed + 1;
  else if (k == ' ')  
    myCar.speed = myCar.speed - 1;
  else if (k == UP)     myCar.up    = true;
  else if (k == DOWN)   myCar.down  = true;
  else if (k == LEFT)   myCar.left  = true;
  else if (k == RIGHT)  myCar.right = true;
}
void keyReleased() {
  int k = keyCode;
  if      (k == UP)     myCar.up    = false;
  else if (k == DOWN)   myCar.down  = false;
  else if (k == LEFT)   myCar.left  = false;
  else if (k == RIGHT)  myCar.right = false;
}
class Car {
  color c;
  float xpos;
  float ypos;
  float speed=7;
  int sizeW = 50;
  int sizeH = 50;
  boolean up, down, left, right;
  float topBorderC;
  float bottomBorderC;
  float rightBorderC;
  float leftBorderC;
  Car() {
    c = color(175);
    xpos = width/2;
    ypos = width/2;
    setBordersC() ;
  }
  void setBordersC() {
    topBorderC = ypos - sizeW/2;
    bottomBorderC = ypos + sizeW/2;
    rightBorderC = xpos + sizeH/2;
    leftBorderC = xpos - sizeH/2;
  }
  void display() {
    rectMode(CENTER);
    stroke(0);
    fill(c);
    rect(xpos, ypos, sizeW, sizeH);
  }
  void move() {
    if (up)    ypos -= speed;
    if (down)  ypos += speed;
    if (left)  xpos -= speed;
    if (right) xpos += speed;
  }
}
class Grape {
  color c;
  float xpos;
  float ypos;
  int sizeW = 10;
  int sizeH = 10;
  float topBorderG;
  float bottomBorderG;
  float rightBorderG;
  float leftBorderG;
  //  float speed;
  Grape() {
    c = color(random(180, 255), 44, 208);
    xpos = int(random(width));
    ypos = int(random(height));
    setBordersG();
  }
  void setBordersG() {
    topBorderG = ypos - sizeW/2;
    bottomBorderG = ypos + sizeW/2;
    rightBorderG = xpos + sizeH/2;
    leftBorderG = xpos - sizeH/2;
  }
  void display() {
    rectMode(CENTER);
    stroke(0);
    fill(c);
    setBordersG();
    rect(xpos, ypos, sizeW, sizeH);
  }
  void tele() {
    xpos = int(random(width));
    ypos = int(random(height));
  }
}


