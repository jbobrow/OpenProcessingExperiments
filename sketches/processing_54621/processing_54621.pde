
// Sketch by Karen Vertierra 2012

int num = 10;
//integers for main growing circle
int circleSize = 0;
int circleSize2 = 30;
int circleSize3 = 60;
int circleX = 200;
int circleY = 200;
//float for background
float[] radius = new float[num];
float mySize = 50;
float[] ypos = new float[num];
float[] speed = new float[num];
color[] myColors = new color[4];
int[] col = new int[num];
  
void setup() {
  
  size(400,400);
  frameRate(30);
  // add colors to the myColors array
  myColors[0] = color(125,18,184,98);
  myColors[1] = color(138,20,76,85);
  myColors[2] = color(255,0,115,98);
  myColors[3] = color(70,42,136,98);
  
  // use a loop to randomly seed ypos, speed, and col
  for(int i=num-1; i>=0; i--) {
    ypos[i] = random(0,height);
    speed[i] = random(-5,5);
    col[i] = floor(random(0,4));
    radius[i] = random(5,100);
  }
  noStroke();
  smooth();
}
  
void draw() {
  background(255, 157, 60);
  noStroke();
    
  for(int i=0; i<num-1; i++) {
    // use the int from col[] to choose the fill from myColors[]
    fill(myColors[col[i]]);
    // draw the ellipse using ypos[]
    ellipse(width/num * i + width/num, ypos[i], radius[i], radius[i]);
    // update ypos[] with speed[]
    ypos[i] = ypos[i] + speed[i];
    radius[i] = radius[i]+2;
      
    //if the circles go off the screen, reset them
    if(ypos[i] > height + mySize/2) ypos[i] = -mySize/2;
    if(ypos[i] < -mySize/2) ypos[i] = height - +mySize/2;
    if(radius[i] > 400) radius[i] = 2;
    if(radius[i] > 100) fill(myColors[col[i]]);
  }
  
  smooth();
  stroke(#FFFFFF);
  noFill();
  // variables showing location and size of circles
  ellipse(circleX,circleY,circleSize,circleSize);
  ellipse(circleX,circleY,circleSize2,circleSize2);
  ellipse(circleX,circleY,circleSize3,circleSize3);
   
  // circleSizes increase by 2
  circleSize = circleSize + 2;
  circleSize2 = circleSize2 + 2;
  circleSize3 = circleSize3 + 2;
  
  // if circles reach a certain size, go back to 0
  if(circleSize > 400) circleSize= 0; 
  if(circleSize2 > 600) circleSize2= 0; 
  if(circleSize3 > 700) circleSize3= 0; 
  
}



