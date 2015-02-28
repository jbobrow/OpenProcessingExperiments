
//variables
Ball myBall;
Ball myBall2;
Ball myBall3;
//Ball myBall4;
//Ball myBall5;
//Ball myBall6;
//Ball myBall7;
//SETUP

void setup(){
  size(500,500);
  noStroke();
  fill(255);
 myBall= new Ball(width/2, height/2, 1,2);
 myBall2= new Ball((int)random(width), (int)random(height),1,2);
 myBall3= new Ball((int)width/3, (int)height/4, 1, 2);
// myBall3= new Ball((int)width/3, (int)height/4, 1, 2);
 //myBall4= new Ball((int)width/3, (int)height/4, 1, 2);
 //myBall5= new Ball((int)width/3, (int)height/4, 1, 2);
 //myBall6= new Ball((int)width/3, (int)height/4, 1, 2);
// myBall7= new Ball((int)width/3, (int)height/4, 1, 2);
}
  
void draw(){
  background(56,123,233);
  myBall.display();
  myBall.move();
  myBall.bounce();
  
  myBall2.display();
  myBall2.move();
  myBall2.bounce();
  
  myBall3.display();
  myBall3.move();
  myBall3.bounce();
  
 //   myBall4.display();
   // myBall4.move();
  //  myBall4.bounce();
  
   // myBall5.display();
   // myBall5.move();
   // myBall5.bounce();
  
   // myBall6.display();
  //  myBall6.move();
   // myBall6.bounce();
  
  //  myBall7.display();
   // myBall7.move();
   // myBall7.bounce();
}
  
//FUCTIONS
    class Ball {
  //VARIABLES
  int xPos;
  int yPos;
  int xSpeed;
  int ySpeed;

  //CONSTRUCTOR

  Ball(int _xPos, int _yPos, int _xSpeed, int _ySpeed) {
    xPos = _xPos;
    yPos = _yPos;
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
  }

  //methods
  void display() {
    ellipse(xPos, yPos, 50, 50);
  }

  void bounce() {
    if (xPos > width || xPos < 0) {
      xSpeed = xSpeed * -1;
    }
    if (yPos > height || yPos < 0) {
      ySpeed = ySpeed * -1;
    }
  }

  void move() {
    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed;
  }
}
 
