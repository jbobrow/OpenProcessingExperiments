
float stiffness = 0.2;
float damping = .75;
float velocityX = 0.0;
float velocityY = 0.0;
float targetY;
float targetX;
float forceX;
float forceY;
float y;
float x;

void setup(){
  size (200,200);
  noStroke();
}

void draw(){
  fill(0, 80);
  rect(0,0,width,height);
  fill(255);
  float forceY = stiffness*(targetY-y);
  float forceX = stiffness*(targetX-x);
  velocityX=damping*(velocityX+forceX);
  velocityY=damping*(velocityY+forceY);
  y+=velocityY;
  x+=velocityX;
  ellipse(x,y,50,50);
  targetY=mouseY;
  targetX=mouseX;
}

