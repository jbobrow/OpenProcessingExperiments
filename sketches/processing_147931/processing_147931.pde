


class Square {
  //parameters
  float xPos, yPos, xSpeed, ySpeed, size;
  Ball myBall = new Ball(width/2, height/2, .1, .2, 20);
  
  //constructor
  Square(float _xPos, float _yPos, float _xSpeed, float _ySpeed, float _size) {
    xPos = _xPos;
    yPos = _yPos;
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
    size = _size;
  }

  void display() {
    rectMode (CENTER);
    rect(xPos, yPos, size, size);
    myBall.display();
    myBall.move();
    myBall.bounce();
  }
  public float getX(){
    return xPos;
  }
  public float getY(){
     return yPos;
  }
  public float getSize(){
     return size;
  }
}

class Ball {
  float xPos, yPos, xSpeed, ySpeed, size;

  Ball(float _xPos, float _yPos, float _xSpeed, float _ySpeed, float _size) {
    xPos = _xPos;
    yPos = _yPos;
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
    size = _size;
  }

  void display() {
    ellipse(xPos, yPos, size, size);
  }

  void move() {
    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed;
  }

  void bounce() {
    if (xPos > mySquare.getX() + mySquare.getSize()/2 || xPos < mySquare.getX() - mySquare.getSize()/2){
      xSpeed = xSpeed * -1;
    }
    if (yPos > mySquare.getY() + mySquare.getSize()/2 || yPos < mySquare.getY() - mySquare.getSize()/2){
      ySpeed = ySpeed * -1;
    }  
  }
}

Square mySquare;

void setup(){
  size(200,200);
  mySquare = new Square (width/2, height/2,0,0,80);
  smooth();

}

void draw(){
background(120);
mySquare.display();


}


