
class Ball {
  //Variables

  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;



  //Constructor
  Ball(float _xPos, float _yPos, float _xSpeed, float _ySpeed) {
    xPos = _xPos;
    yPos = _yPos;
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
  }


  //methods
  void display() {
    ellipse(xPos, yPos, 50, 50);
  }

  void move() {
    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed;
  }

  void bounce() {
    if (xPos > width || xPos < 0) {
      xSpeed = xSpeed * -1;
    }
    if (yPos > height || yPos < 0) {
      ySpeed = ySpeed * -1;
    }
  } 

  void gravity() {
    ySpeed = ySpeed + .2;
  }
}

//Variable

Ball myBall;
Ball myBall2;
Ball myBall3;
Ball myBall4;

//setup(){

void setup() {  
  size(500, 500);
  myBall= new Ball(width/2, height/2, 1, 2);
  myBall2= new Ball((int)random(width), (int)random(height), 4, 2);
  myBall3= new Ball((int)width/3, (int)height/4, 3, 2);
  myBall4= new Ball((int)width/4, (int)height/5, 2, 3);
}


//draw()


void draw() {
  background(500);
  
  myBall.display();
  myBall.move();
  myBall.bounce();
  myBall.gravity();
  
  
  myBall2.display();
  myBall2.move();
  myBall2.bounce();
  myBall2.gravity();
  
  myBall3.display();
  myBall3.move();
  myBall3.bounce();
  myBall3.gravity();
  
  myBall4.display();
  myBall4.move();
  myBall4.bounce();
  myBall4.gravity();
  
}



//function()



