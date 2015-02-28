
//Y Direction
int yPos = 200;
int yVel = 1;
float r;
float g;
float b;
float a;

int xPos = 200;
int xVel = 1;

void setup(){
  size(400,400);
  frameRate(60);
  smooth();
  ellipseMode(CENTER);
  noStroke();
}
void draw(){
  fill(255,255,255,10);//set color white to reset background... 4th input is alpha
  //try adjusting...
  rect(0,0,400,400);
  fill(r,g,b,a);
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);

  for(int i = 0; i < 4; i ++){
    //Y Direction
    ellipse(xPos, yPos, 100-12*i, 100-12*i);
  //this will draw a vertical
  }
  moveCircles(5);//this number will change the speed of circles
  //noLoop();
}
void moveCircles(int speedMultiplier){
  // Y Direction
  if(yPos == 10 || yPos == 390){ //checks to see if the circles are at the top pr bottom
    yVel = yVel*(-1); //if they are, change the direction of movement
  }
  yPos = yPos + speedMultiplier * yVel;
  //X Deriction
  if(xPos == 10 || xPos == 390){
    xVel = xVel*(-1);
  }
  xPos = xPos + speedMultiplier * xVel;
}
  
  

