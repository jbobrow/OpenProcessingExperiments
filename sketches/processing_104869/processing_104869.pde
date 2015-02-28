
int xPos;
int yPos;
int cx = 100;
int cy = 10;
int r=75; //radius of bouncing ball
int vx=2; //bouncing ball's direction on the x-axis
int vy=3; //bouncing ball's direction on the y-axis

void setup(){
  size(600, 600);
  xPos = width/2;
  yPos = height/2;
  
//  background(0, 6, 231);
 
}

void draw(){
  

  fill(255, 0, 0);
  background(0, 6, 231);
  smooth();
  ellipseMode(CENTER);
  ellipse(cx, cy, r, r);
  
  cy = cy + vy;
  
  if(mouseX > 0){
    xPos ++; 
  }  
  
if((cy>height-40)||(cy<0)){
  vy = vy * -1;
}

cx = cx + vx;

if((cx > width - 10)||(cx < 0)){
  vx = vx * -1;

  

}
  }
