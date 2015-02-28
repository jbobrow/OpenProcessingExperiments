
// This is a Cool Color Scheme Arc
//set start fill() color as yellow : Hue = PI/3;
float startFill;
// set start drawing arc from angle PI
float startAngle;
// set how many arcs are drawn
int step;
float stepLength;

float centerX;
float centerY;

float pSize;
float pAngle;
float pFill;
float bValue;

void setup(){
  size(250, 125);
  colorMode(HSB, 2*PI, 100, 100);
  smooth();
}

void draw(){
  background(0,0,95);
  ellipseMode(CENTER);
  noStroke();
  
  //change the step value to increse or decrease precision of the sliders
  step = 5;
  
  //parameters for Arc slider
  centerX = width/2;
  centerY = height;
  startFill = PI/3;
  startAngle = PI;
  stepLength = PI/step;
  
  //parameters for Cone slider
  pSize = width;
  bValue = 100;
  //define from which angle the Cone is drawn
  pAngle = startAngle + stepLength;
  pFill = startFill + stepLength;
  
  // draw arcs
  for(int i=0; i<step; i++){
    fill(startFill, 85, 100);
    arc(centerX, centerY, width-10, width-10, startAngle, startAngle+stepLength);
    startFill = startFill + stepLength;
    startAngle = startAngle + stepLength;
  }
 
 // draw center circle that blocks the center of the arcs
  fill(0,0,95);
  ellipse(centerX, centerY, 200, 200);
  
  //Brightness pointer that follows mouse cursor, 
  //in this demonstration there's no mouse interaction, demo only
 for(int i=0; i<step; i++){
    fill(pFill, bValue, 100);
    stroke(0,0,100);
    arc(centerX, centerY, pSize, pSize, pAngle, pAngle+stepLength);
    bValue = bValue -100/step;
    pSize = pSize - width/step;
  }
  
 //Further develoment requests mouse interaction to let the Cone slider rotate
 //corresponding to the cursor location 
  
}

