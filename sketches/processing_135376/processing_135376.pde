
//Variable

Ball myBall;
Ball myBall2;
Ball myBall3;

//setup()

void setup(){
  size(500,500);
  myBall= new Ball(width/2, height/2, 1,2);
  myBall2= new Ball((int)random(width), (int)random(height),1,2);
  myBall3= new Ball((int)width/3, (int)height/4, 1, 2);

}


//draw()

void draw(){
  background(185);
  myBall.display();
  myBall.move();
  myBall.bounce();
  
  myBall2.display();
  myBall2.move();
  myBall2.bounce();
  
  myBall3.display();
  myBall3.move();
  myBall3.bounce();
}


//funtions 

class  Ball{
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

//methods
 
 void display(){
   ellipse(xPos, yPos, 50,50);
 }
 
  void move(){
    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed;
  }
  
  void bounce(){
    if(xPos > width|| xPos < 0){
    xSpeed = xSpeed * -1;
   }
   
   if (yPos > height || yPos < 0){
     ySpeed = ySpeed * -1;
   }
   
  }   
}

