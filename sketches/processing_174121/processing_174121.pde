
float GRAVITY;
float[] XSPEED;
float[] xCenter, yCenter, radius, xVel, yVel, xAccel, yAccel;
color[] ballCol;
float lineStart, lineEnd, lineHeight;
int ballNum = 100;
boolean isOn;
void setup(){
  //size(displayWidth, displayHeight);
  size(600, 600);
  background(255);
  lineHeight = 100;
  isOn = false;
  radius = new float[ballNum];
  xCenter = new float[ballNum];
  yCenter = new float[ballNum];
  xVel = new float[ballNum];
  yVel = new float[ballNum];
  xAccel = new float[ballNum];
  yAccel = new float[ballNum];
  ballCol= new color[ballNum];
  XSPEED = new float[ballNum];
   
  lineStart = width/2 -100 ;
  lineEnd = width/2 + 100;
  
  for(int i = 0; i < ballNum; i++){
  radius[i] = 30;
    xCenter[i] = lineStart + (lineEnd - lineStart)/ballNum * i;
    yCenter[i] = lineHeight - radius[i]; 
    xVel[i] = 0;
    XSPEED[i] = random(-10, 10);
    yVel[i] = 0;
    xAccel[i] = 0;
    ballCol[i] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)), 150);
  }
  //lineEnd = 2 * radius[0];

  
  GRAVITY = .05;
  
}

void draw(){
  //println(XSPEED);
  //println(xVel);
  background(255);
  fill(0);
  strokeWeight(3);
  stroke(0);
  line(lineStart, lineHeight, lineEnd, lineHeight);
  for(int i = 0; i < ballNum; i++){
      ballUpdate(i);
      ballDisplay(i);
  }

  //stroke(255, 0 , 0);
  //line(xCenter, yCenter);
}

void mouseReleased(){
  for(int i = 0; i < ballNum; i++){
    xVel[i] = XSPEED[i];
    yAccel[i] = GRAVITY;
  }
  isOn = true;
}

void ballUpdate(int i){
  yAccel[i] = (xCenter[i] > lineEnd && isOn || ( xCenter[i] < lineStart))? GRAVITY : 0;
  xVel[i] += xAccel[i];
  yVel[i] += yAccel[i];
  
  xCenter[i] += xVel[i];
  xCenter[i] = mod(xCenter[i], width);
  yCenter[i] += yVel[i];
}

void ballDisplay(int i){
  fill(ballCol[i]);
  stroke(ballCol[i]);
  ellipse(xCenter[i], yCenter[i], 2 * radius[i], 2 * radius[i]);
 // line(xCenter[i], yCenter[i], xCenter[i] + xVel[i], yCenter[i] + yVel[i]);
}

float mod(float a, float b){
  return a >= 0 ? a % b : a % b + b;
}

void keyPressed(){
  setup();
}



