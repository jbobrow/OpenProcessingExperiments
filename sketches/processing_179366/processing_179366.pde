
int cx, cy;
int segmentCount = 70;
int stepHeight = 1000;
int step = 0;
float plotDiameter, plotRadius, plotCircumference;

void setup(){
  size(500, 500, OPENGL);
  cx = width/2;
  cy = height/2;
  plotDiameter =  width * 1.7;
  plotRadius  = plotDiameter/2;
  plotCircumference =  PI * plotDiameter;
  frameRate(20);
  background(80);
  noStroke();
  fill(255);
  smooth();
}

void draw(){
  beginCamera();
  camera((width/2.0), -(height*4), -1500, width/2.0, height/2.0, 0, 0, 1, 0);
  rotateZ(radians(180));
  endCamera();

  if(stepHeight == -1000){
    //offscreen
    return;
  }
  
  float theta = step * TWO_PI / segmentCount;
  float x = cx + cos(theta) * plotRadius;
  float y = cy + sin(theta) * plotRadius;
  
  theta = (step + segmentCount/2) * TWO_PI / segmentCount;
  float x2 = cx + cos(theta) * plotRadius;
  float y2 = cy + sin(theta) * plotRadius;

  stepHeight = stepHeight - 5;

  pushMatrix();
  fill(255);
  translate(x2, y2, stepHeight);
  sphere(20);
  popMatrix();

  pushMatrix();
  fill(100);
  translate(x, y, stepHeight);
  sphere(20);
  popMatrix();
  
  if(step == segmentCount){
    step = -1;
  }
  
  step++;
}
