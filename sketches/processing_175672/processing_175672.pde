
float ellipseWidth;
float ellipseHeight;
float ellipseAngle;
float ellipseWidtellipseHeightAngle;
float ellipseHeightAngle;
float cellipseHeightAngle;
float einc, widthAngleInc, heightAngleInc;
float hnoise, wnoise;
float hNoiseInc, wNoiseInc, zNoiseInc, chNoiseInc, cEllipseNoiseInc;

float midX, midY;
float frame = 0;
float zAngle = 0;
float zNoise;
float chnoise;

void setup() {
  size(640,640);
  ellipseWidth = 200;
  ellipseHeight = 200;
  ellipseAngle = 0;
  ellipseWidtellipseHeightAngle = 0;
  ellipseHeightAngle = 0;
  cellipseHeightAngle = 0;
  einc = 0.01;
  widthAngleInc = 0.01;
  heightAngleInc = 0.01;
  cEllipseNoiseInc = 0.1;
  wnoise = 200;
  hnoise = 2000;
  zNoise = 100;
  chnoise = 300;
  
  wNoiseInc = 0.01;
  hNoiseInc = 0.01;
  zNoiseInc = 0.01;
  chNoiseInc = 0.1;
  
  midX = width/2;
  midY = height/2;
}

void draw() {
  
  if(frame < 350)
  {
    
  
  //background(0, 80);
  fill(0, 40);
  rect(0, 0, width, height);
  ellipseAngle += einc;
  //ellipseWidtellipseHeightAngle += widthAngleInc;
  //ellipseHeightAngle += heightAngleInc;
  
  float wn = noise(wnoise);
  ellipseWidtellipseHeightAngle += map(wn, 0, 1, -0.05, 0.05);
  wnoise += wNoiseInc;
  
  float hn = noise(hnoise);
  ellipseHeightAngle += map(hn, 0, 1, -0.05, 0.05);
  hnoise += hNoiseInc;
  
  float zn = noise(zNoise);
  zAngle += map(zn, 0, 1, -0.03, 0.03);
  zNoise += zNoiseInc; 
  
  float chn = noise(chnoise);
  cellipseHeightAngle += map(chn, 0, 1, -0.2, 0.2);
  cellipseHeightAngle += chNoiseInc;
  
  
  //drawReferenceEllipse();
  //drawReferencePoint();
  
  float minRadius = height/7;
  float maxRadius = height * 2;
  drawOscilatingEllipses(10, minRadius, maxRadius);
  //drawOscilatingEllipseReferencePoint();
  
  }
  
  
}
  
void drawReferenceEllipse(){
  fill(255, 200);
  stroke(50);
  pushMatrix();
  translate(midX, midY);
  ellipse(0, 0, ellipseWidth, ellipseHeight);
  popMatrix();
}

void drawReferencePoint()
{
  
  fill(255, 128, 128, 200);
  stroke(50);
  pushMatrix();
  translate(midX, midY);
  
  float x = cos(ellipseAngle) * (ellipseWidth / 2);
  float y = sin(ellipseAngle) * (ellipseHeight / 2);
  
  ellipse(x, y, 10, 10);
  popMatrix();
}

void drawOscilatingEllipse(float p_width, float p_height, int p_index){
  colorMode(HSB, 255);
  fill(cellipseHeightAngle, 128, 200, 2);
  stroke(40, 150, 200, 80 / (0.9 * (p_index + 1)));
  strokeWeight(2);
  pushMatrix();
  translate(midX, midY);
  rotate(zAngle);

  
  float widthRadius = ellipseWidth + (cos(ellipseWidtellipseHeightAngle) * p_width / 2);  
  float heightRadius = ellipseHeight + (sin(ellipseHeightAngle) * p_height / 2);  
  ellipse(0, 0, widthRadius, heightRadius);
  popMatrix();  
}

void drawOscilatingEllipses(float p_numEllipses, float p_minRadius, float p_maxRadius)
{
  float radiusIncrement = (p_maxRadius - p_minRadius) / p_numEllipses;
  for(int i = 0; i < p_numEllipses; i++)
  {
    drawOscilatingEllipse(p_minRadius + radiusIncrement * i, p_minRadius + radiusIncrement * i, i);
  }
}
    


void drawOscilatingEllipseReferencePoint()
{
  fill(0, 255, 128, 200);
  stroke(50);
  pushMatrix();
  translate(midX, midY);
  
  float widthRadius = ellipseWidth + (cos(ellipseWidtellipseHeightAngle) * ellipseWidth / 2); 
  float heightRadius = ellipseHeight + (sin(ellipseHeightAngle) * ellipseWidth / 2);
  float x = cos(ellipseAngle) * (widthRadius / 2);
  float y = sin(ellipseAngle) * (heightRadius / 2);
  
  
  ellipse(x, y, 10, 10);
  popMatrix();
}

