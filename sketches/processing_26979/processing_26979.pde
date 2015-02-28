
//Kate Easton
//z3290017
//Lesson Three Project

Ball myBall1;
Ball myBall2;

int w = 30;
int h = 30;
int speed = 1;

void setup(){
  size(200,200);
  
  myBall1 = new Ball(color(180,60,35),0,30,45,45);  
  myBall2 = new Ball(color(100,160,135),50,120,w,h);
}

void draw(){
  background(255);
  stroke(0);
  myBall1.move();
  myBall1.display();
  myBall2.move2();


  for(int y=0; y<height; y+=20) {
    line(0,y,width,y);
fill(100,160,135);
ellipse(50,120,w,h);
}
   {
fill(260-mouseX,50-mouseX,mouseX+130);
rect(100,130,60,60);
 }
}
  
class Ball{
  color c;
  float xpos;
  float ypos;
  float xspeed;
  int thesize;
  
  Ball(color tempC, float tempXpos, float tempYpos, int tempSize, float tempSpeed){
    c = tempC;
    xpos = tempXpos;
    ypos=tempYpos;
    xspeed=tempSpeed;
    thesize=tempSize;
  }
  
  void move(){
    xpos=xpos+xspeed/10;
    if (xpos>width){
      xpos=0;
    }
 }
 void move2(){
   w=w+speed;
   if ((w > 100) || (w<0))  
speed = speed * -1;
 }
 
  void display(){
    stroke(0);
    fill(c);
    ellipseMode(CENTER);
    int offset = thesize/4;
    ellipse(xpos,ypos,thesize,thesize/2);
  }
}

