
Car myCar;
Grape newGrape;

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
  
  if (topBorderG > topBorderC && bottomBorderG < bottomBorderC && 
        leftBorderG > leftBorderC && rightBorderG < rightBorderC) {
          newGrape.tele();
        }
}



  void keyPressed() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        myCar.moveLeft();
      } 
      else if (keyCode == RIGHT) {
        myCar.moveRight();
      } 
      else if (keyCode == UP) {
        myCar.moveUp();
      } 
      else if (keyCode == DOWN) {
        myCar.moveDown();
      }
    }
  }

class Car {
  color c;
  float xpos;
  float ypos;
  float speed;
  int sizeW = 50;
  int sizeH = 50;
   
  Car() {
    c = color(175);
    xpos = width/2;
    ypos = width/2;
    speed = 7;
    
    
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
 
  
  void moveRight() {
    xpos = xpos + speed;
    setBordersC();    
    if (xpos > width) {
      xpos = 0;
    }
  }
  
  void moveLeft() {
    xpos = xpos - speed;
    setBordersC();
    if (xpos < 0) {
      xpos = width;
    }
  }
  
  void moveUp() {
    ypos = ypos - speed;
    setBordersC();
    if (ypos < 0) {
      ypos = height;
    } 
  }
  
  void moveDown() {
    ypos = ypos + speed;
    setBordersC();
    if (ypos > height) {
      ypos = 0;
    }
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


