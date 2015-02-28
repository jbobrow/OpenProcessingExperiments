
int x =10;
int y =250;
int speedX=3;
int speedY=3;

void setup(){
 size(720,576);
 smooth();
 noStroke();
 ellipseMode(CENTER);
 
  
  
}


void draw(){
  background(0);
  ellipse(x,y,80,30);
  ellipse(x,y,40,40);
  
  x+= speedX;
  y+= speedY;
  
  if (x>= width ||x<0)
  {
    speedX=-speedX;
    
  }
  // if (y>= height ||y<0)
  {
  
  speedY=-speedY;
}
  
}


