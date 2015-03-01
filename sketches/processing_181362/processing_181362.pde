
Ball myBall;
Ball myBall2;
Ball myBall3;
Background myBackground;

void setup(){
 size(600,600);
 smooth();
 myBall = new Ball(300,55);
 myBall2 = new Ball(100,30);
 myBall3= new Ball(50,10);
 myBackground = new Background(); 
}


void draw(){ 
  
   myBall.run();
   myBall2.run();
   myBall3.run();
   }
 
class Background {

int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2;

Background(){
  
}
 void run(){
   setGradient(0, 0, width/2, height, b1, b2, X_AXIS);
   setGradient(width/2, 0, width/2, height, b2, b1, X_AXIS);
 }
  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
}
  
class Ball{
  float x = 0;
  float y = 0;
  float speedX = -2;
  float speedY = 0.5;

  
  Ball(float _x, float _y){
    x= _x;
    y= _y;
    
  }
 void run(){
  display();
  move();
  bounce();
  gravity(); 
   
 }
 
 void gravity(){
   speedY += 0.2; 
   
 }

 void bounce(){
  if (x> width){
   speedX = speedX * -1; 
  }
  if (x<0){
   speedX = speedX * -1; 
  }
  if (y > height){
   speedY = speedY * -1; 
  }
  if (y < 0){
   speedY = speedY * -1; 
  }
 }
 
 
 void move(){
  x+= speedX; 
  y+= speedY;
   
 }
 
  void display(){
   ellipse(x,y,20,20); 
  }
  
  
}


