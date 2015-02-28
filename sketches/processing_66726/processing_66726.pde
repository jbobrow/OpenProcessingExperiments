
float d;
float xPos;
float yPos;
float xVel;
float yVel;


 
void setup() {
  size(600, 600);
  smooth();
  frameRate(40);
  fill(1);
 
  xPos=random(0+ d/2, width-d/2);
  yPos=random(0+ d/2, height-d/2);
  xVel=random(-1, 1);
  yVel=random(-5, 5);
  d=random(10, 10);
}
 
void draw() {
  background(255);
  stroke(255);
  strokeWeight(5);
  fill(0, 22, 189);
  ellipse(xPos, yPos, d, d);

   
  xPos=xPos+xVel;
  yPos=yPos+yVel;
   
  //left wall
  if (xPos<0+d/2) {
    xVel=xVel*(-1);
   grow(.5);

  }
  //top wall
  if (yPos<0+d/2) {
    yVel=yVel*(-1);
   grow(1);

  }
  //right wall
  if (xPos>width-d/2) {
    xVel=xVel*(-1);
   grow(1.5);
 
  }
  //bottom wall
  if (yPos>height-d/2) {
    yVel=yVel*(-1);
   grow(2);
  }
  
}
void grow(float amt){
  d=d+amt;
}



