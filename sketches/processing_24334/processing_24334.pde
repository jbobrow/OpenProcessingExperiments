
int bgColor; // sets color of background
int xStart; // starting point x axis
int yStart;  // starting point y axis
int diamX;  // x axis diameter of ellipse
int diamY;  // y axis diameter of ellipse
int xScale;
int yScale;
int sColor;  // stroke color

void setup(){
  size(400,400);
  smooth();
  xStart = 200;
  yStart = 200;
  diamX = 120;
  diamY = 20;
  xScale = 2;
  yScale=2;
  sColor = 255;
  bgColor = 0;
 
 
}


  void draw(){
  background(bgColor);
  stroke(sColor);
  for(float i = 0; i < 20; i ++){
    pushMatrix();
    
    noFill();
    translate(xStart,yStart);
    scale(xScale,yScale);
     rotate(radians(i*mouseY));
    ellipse(0,0,diamX,diamY);
    popMatrix();
    
  }
}

