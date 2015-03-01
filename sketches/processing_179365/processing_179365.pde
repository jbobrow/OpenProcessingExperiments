
//Plotting a circle
 
int cx, cy;
int segmentCount = 100;
int step = 0;
float plotDiameter, plotRadius, plotCircumference;
 
void setup(){
  size(500, 500);
  cx = width/2;
  cy = height/2;
  plotDiameter =  width * .75;
  plotRadius  = plotDiameter/2;
  plotCircumference =  PI * plotDiameter;
  frameRate(20);
  background(80);
  noStroke();
  fill(255);
}
 
void draw(){
  float angle = step * TWO_PI / segmentCount;
  float x = cx + cos(angle) * plotRadius;
  float y = cy + sin(angle) * plotRadius;
  ellipse(x, y, 10, 10);
 
  if(step == segmentCount){
    background(80);
    step = -1;
  }
  
  step++;
}
