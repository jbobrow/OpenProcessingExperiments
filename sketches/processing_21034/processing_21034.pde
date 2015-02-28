
color green = color(45, 157, 2, 200);
float xCirc, yCirc, xLast, yLast;
float r, xo, yo;
PFont font;
PImage p0, p30, p45, p60, p90, p120, p135, p150, p180, p210, p225, p240, p270, p300, p315, p330, p360;
boolean snap = false;


void setup() {
  size(800, 450);
  smooth();
}


void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);
  
  //lines
  drawLines();
  
  xo = 170;
  yo = height/2;
  line(0, height/2, width, height/2);
  line(xo, 0, xo, height);
  noFill();
  stroke(0);
  r = PI/2*70;
  ellipse(xo, yo, 2*r, 2*r);
  stroke(0);
  float theta = atan((yo - mouseY)/(mouseX - xo));
  
  //rotateLine
  snap = false;
  if(theta < .04 && theta > -.04) {
    rotateLine(0);
    snap = true;
  }
  if(theta < .5636 && theta > .4836) {
    rotateLine(PI/6);
    snap = true;
  }
  if(theta < .825 && theta > .745) {
    rotateLine(PI/4);
    snap = true;
  }
  if(theta < 1.087 && theta > 1.007) {
    rotateLine(PI/3);
    snap = true;
  }
  if(theta < PI/2 && theta > 1.5308) {
    rotateLine(PI/2);
    snap = true;
  }
  if(theta > -PI/2 && theta < -1.5308) {
    rotateLine(-PI/2);
    snap = true;
  }
  if(theta > -.5636 && theta < -.4836) {
    rotateLine(-PI/6);
    snap = true;
  }
  if(theta > -.825 && theta < -.745) {
    rotateLine(-PI/4);
    snap = true;
  }
  if(theta > -1.087 && theta < -1.007) {
    rotateLine(-PI/3);
    snap = true;
  }
  if (snap == false) {
    rotateLine(theta);
  }
  
  //println(theta);
}


void drawLines() {
  int[] angles = {30, 45, 60, 120, 135, 150, 210, 225, 240, 300, 315, 330};
  stroke(225);
  for(int i = 0 ; i < angles.length ; i++) {  
    line(xo, yo, xo + r*cos(radians(angles[i])), yo - r*sin(radians(angles[i])));
  }
  stroke(0);
} 

void rotateLine(float theta) {
  //left circle
  if(mouseX < xo) {
    fill(0);
    line(xo, yo, xo - r*cos(theta), yo + r*sin(theta));
    
    //Cosine
    stroke(255, 0 , 0);
    fill(255, 0, 0, 240);
    line(xo - r*cos(theta), yo, xo - r*cos(theta), yo + r*sin(theta));
    ellipse(xo - r*cos(theta), yo, 5, 5);
    
    //Sine
    stroke(255, 3, 226);
    fill(255, 3, 226, 240);
    line(xo, yo + r*sin(theta), xo - r*cos(theta), yo + r*sin(theta));
    ellipse(xo, yo + r*sin(theta), 5, 5);
    
    //CoTangent
    stroke(3, 255, 59, 240);
    fill(3, 255, 59, 240);
    line(xo - r*cos(theta), yo + r*sin(theta), xo, yo + r*1/sin(theta));
    ellipse(xo, yo + r*1/sin(theta), 5, 5);
    
    //Tangent
    stroke(0, 102, 255, 240);
    fill(0, 102, 255, 240);
    line(xo - r*cos(theta), yo + r*sin(theta), xo - r*1/cos(theta), yo);
    ellipse(xo - r*1/cos(theta), yo, 5, 5);
    
    stroke(0);
    fill(0);
    ellipse(xo - r*cos(theta), yo + r*sin(theta), 5, 5); //black dot on Circle
    noFill();
    
  }

  //right circle
  else {
    fill(0);
    line(xo, yo, xo + r*cos(theta), yo - r*sin(theta));
    
    //Cosine
    stroke(255, 0 , 0, 240);
    fill(255, 0, 0, 240);
    line(xo + r*cos(theta), yo, xo + r*cos(theta), yo - r*sin(theta));
    ellipse(xo + r*cos(theta), yo, 5, 5);
    
    //Sine
    stroke(255, 3, 226, 240);
    fill(255, 3, 226, 240);
    line(xo, yo - r*sin(theta), xo + r*cos(theta), yo - r*sin(theta));
    ellipse(xo, yo - r*sin(theta), 5, 5);
    
    //CoTangent
    stroke(3, 255, 59, 240);
    fill(3, 255, 59, 240);
    line(xo + r*cos(theta), yo - r*sin(theta), xo, yo - r*1/sin(theta));
    ellipse(xo, yo - r*1/sin(theta), 5, 5);
    
    //Tangent
    stroke(0, 102, 255, 240);
    fill(0, 102, 255, 240);
    line(xo + r*cos(theta), yo - r*sin(theta), xo + r*1/cos(theta), yo);
    ellipse(xo + r*1/cos(theta), yo, 5, 5);
    
    stroke(0);
    fill(0);
    ellipse(xo + r*cos(theta), yo - r*sin(theta), 5, 5); //black dot on circle
    noFill();
  }
  println(theta);
}

                
                                
