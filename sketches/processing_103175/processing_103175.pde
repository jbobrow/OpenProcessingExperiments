
Car myCar;
Grape newGrape;

int speed = 7;

float xposGrape;
float yposGrape;
float xposCar;
float yposCar;

float topBorderG;
float bottomBorderG;
float rightBorderG;
float leftBorderG;

float topBorderC;
float bottomBorderC;
float rightBorderC;
float leftBorderC;

void setup() {
  size(500, 500);
  myCar = new Car();
  newGrape = new Grape();
}

void draw() {
  background(255);

  newGrape.display(); 
  myCar.display();
  myCar.move();
}

class Car {
  color c;
  float xpos;
  float ypos;
  float speed;
  int sizeW = 50;
  int sizeH = 50;
  
  boolean up, down, left, right;
   
  Car() {
    c = color(175);
    xpos = width/2;
    ypos = width/2;
       
    
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
  void keyPressed() {
    
    int k = keyCode;
   
    if (k == ENTER | k == RETURN)
      speed = speed + 1;
    else if (k == ' ')   
      speed = speed - 1;
  
    else if (k == UP)    up    = true;
    else if (k == DOWN)  down  = true;
    else if (k == LEFT)  left  = true;
    else if (k == RIGHT) right = true;
  }
  
  void keyReleased() {
    int k = keyCode;
    
    if      (k == UP)    up    = false;
    else if (k == DOWN)  down  = false;
    else if (k == LEFT)  left  = false;
    else if (k == RIGHT) right = false;
    
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
  
//  float speed;
  
  Grape() {
    c = color(216, 44, 208);
    xpos = int(random(width));
    ypos = int(random(height));
//    speed = 5;
    
    
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


