
//variables
Ball myBall;
Ball thatBall;
Ball thisBall;
Ball aBall;

//setup()
void setup(){
  background(100);
  size(500,500);
  myBall =new Ball(width/2,height/2,1,2);  
  thatBall = new Ball(width/2,height/2,-1,2);
  thisBall = new Ball(width/2,height/2,1,-2);
  aBall = new Ball(width/2,height/2,-1,-2);
}
//draw()
void draw(){
  fill(0,200,100);
  myBall.display();
  myBall.move();
  myBall.bounce();
  thatBall.display();
  thatBall.move();
  thatBall.bounce();
  thisBall.display();
  thisBall.move();
  thisBall.bounce();
  aBall.display();
  aBall.move();
  aBall.bounce();
}
//function()


//
class Ball{
  //variables
  int xPos;
  int yPos;
  int xSpeed;
  int ySpeed;
  //Constructor 
  Ball(int _xPos, int _yPos, int _xSpeed, int _ySpeed){
    xPos = _xPos;
    yPos = _yPos;
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
  }
  //Methods
  void display(){
    ellipse(xPos,yPos,50,50);
  }
  void move(){
    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed;
  }
  void bounce(){
   if(xPos > width || xPos < 0){
    xSpeed = xSpeed * -1; 
  }
   if(yPos > height || yPos < 0){
     ySpeed = ySpeed * -1;
   }
  }
}


