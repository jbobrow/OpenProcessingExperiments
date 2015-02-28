
//variable

Ball myBall;
Ball myBall2;
Ball myBall3;


//setup()
void setup(){
  size(500,500);
  myBall= new Ball(width/2,height/2,10,5);
  myBall2= new Ball(width/10,height/10,15,5);
  myBall3= new Ball(width/8,height/15,25,20);
}


//draw()
void draw(){
  background(125);
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



//function()


class Ball{
//variables
int xPos;
int yPos;

int xSpeed;
int ySpeed;

//constructor 
Ball(int _xPos, int _yPos, int _xSpeed, int _ySpeed){
    xPos = _xPos;
    yPos = _yPos;
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
   
   
 }
 
 //methods
 
 void display(){
   ellipse(xPos,yPos,50,50);
  
 }
 
 void move(){
   xPos = xPos + xSpeed;
   yPos = yPos + ySpeed;
   
 }

void bounce(){
 if (xPos > width || xPos < 0){
   xSpeed = xSpeed * -1;
 }
 if (yPos > height || yPos < 0){
  ySpeed = ySpeed * -1; 
 }
 
 
} 
 
 
}


