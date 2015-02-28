
/*
    inits
*/ 

float posX;
float posY;
float size1;
float size2;
float size3;
float size4;
float ellipse1 = 0.0;
float ellipse2 = 0.0;
float[] ellipseSizes = new float[4];

int APP_WIDTH;
int APP_HEIGHT;

float offsetValue;
float destX2 = 0;
float destY2 = 0;
int currentAngle = 0;
int maxAngle = 360;


/*
    run functions
*/ 


void setup(){
  currentAngle = 45;
  APP_WIDTH = 400;
  APP_HEIGHT = 400;
  size(400,400);   // hardcode for web. lame.
  smooth();
}


void draw(){
  posX = mouseX;
  posY = mouseY;

  drawBackground();  
  drawLines();
  drawOuterCircles();
  if (mousePressed) drawInnerCircles(ellipseSizes);
}


/*
    helper functions.
*/ 


void drawBackground(){
  strokeWeight(1);
  fill(244,244,244, 180);
  rect(0, 0, APP_WIDTH, APP_HEIGHT);
}


void drawLines(){
  stroke(190, 20, 0, 39);
  line(posX, 0, posX, APP_HEIGHT);
  line(0, posY, APP_WIDTH, posY);
}


void drawOuterCircles(){
  ellipseMode(CENTER);
  noFill();
  
  // get sizes
  size1 = (APP_WIDTH-posX)*2;
  size2 = (posX)*2;
  size3 = (APP_WIDTH-posY)*2;
  size4 = (posY)*2; 
  
  // find smallest radius
  ellipseSizes = new float[]{size1, size2, size3, size4};
  ellipseSizes = sort(ellipseSizes);
  
  // draw smallest with one colour, the rest with other colours.
  stroke(23, 153, 255, 160);
  ellipse(posX, posY, ellipseSizes[0], ellipseSizes[0]);
    
  stroke(184, 74, 44, 22);
  for (int i = 1; i <= 3; i += 1){ 
    ellipse(posX, posY, ellipseSizes[i], ellipseSizes[i]);
  }
}


PVector getPos(int someAngle){
  destX2 = cos(radians(someAngle)) * ellipse2;
  destY2 = sin(radians(someAngle)) * ellipse2;
  return new PVector(destX2, destY2);
}


float getOffsetValue(float ellipse1){
  float destX = cos(radians(45)) * ellipse1;
  float destY = sin(radians(45)) * ellipse1;
  return dist(posX, posY, posX + destX, posY + destY);
}


void drawInnerCircles(float[] ellipseSizes){
  noStroke();
  fill(10, 24);
  
  ellipse1 = ellipseSizes[0]/2;
  ellipse2 = ellipseSizes[0]/4; 
  offsetValue = getOffsetValue(ellipse1);
  
  if(mouseButton == LEFT) currentAngle = 0; 
  if(mouseButton == RIGHT) currentAngle = (currentAngle+5) % maxAngle;
    
  for (int i = 0; i < 4; i++){
    drawEllipse(getPos(currentAngle), offsetValue);
    currentAngle += 90;
  }
} 


void drawEllipse(PVector pos, float offsetValue){
  ellipse(posX + pos.x, posY + pos.y, offsetValue, offsetValue);
}
  
  
  



