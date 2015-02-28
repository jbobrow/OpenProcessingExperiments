
int numBalls = 3;
float x, y;
float spdX = 7.0;
float spdY = 4.0;
float radius = 20.0;
float friction = .75;
float damping = .65;
float gravity = .02;


 
  
void setup() {
  size(400, 400);
  smooth();
  background(200, 300, 850);
  
   
 
}
 
void draw() {
 //ball
  fill(0, 50, 80); 
  rect(-3, -3, width+2, height+2); 
  
  
   
  fill(200, 100, 160);
  stroke(5);
  ellipse(x, y, radius*3, radius*3);
  x+=spdX;
  spdY += gravity;
  y+=spdY;
  
    if (x>width-radius){
    x = width-radius;
    spdX*=-1;
  } else
  
  if (x < radius) {
    x = radius;
    spdX*=-1;
  } if (y>height-radius){
    y = height-radius;
    spdY*=-1;
    spdY *= damping;
    spdX *= friction;
  } else if (y<radius) {
    y = radius;
    spdY*=-1;
  }
  //ball end
  
}
  



