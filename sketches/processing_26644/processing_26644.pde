
//Two ball objecs
Ball ball1;
Ball ball2;

float gravity = 0.1;

void setup() { 
  size(200,200);
  smooth();
  
  ball1 = new Ball(50,0,16);
  ball2 = new Ball(100,50,32);
}

void draw() {
  background(255);
  
  ball1.display(); 
  ball2.display();
  ball1.update();
  ball2.update();

}
class Ball {
  float x; // x location of sqaure
  float y; // y location of sqaure
  float speed; // speed of sqaure
  float w; // size
  
  Ball(float tempX,float tempY,float tempW) { 
    x = tempX; 
    y = tempY;
    w = tempW;
    
      speed = 0;
  } 
  
  void display() {
   fill(175);
   stroke(0);
   ellipse(x,y,w,w);
  }
  
 void update () {
  y = y + speed; 
  speed = speed + gravity;
  if (y > height) {
 speed = speed * -0.95;
  }
  
 }
  
}


