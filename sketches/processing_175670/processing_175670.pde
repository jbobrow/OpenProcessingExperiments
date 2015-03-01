
float ewidth;
float eheight;
float eangle;
float wangle;
float hangle;
float changle;
float einc, winc, hinc;
float hnoise, wnoise;
float hnoiseInc, wnoiseInc, znoiseInc, chnoiseInc, changleInc;

float midX, midY;
float frame = 0;
float zangle = 0;
float znoise;
float chnoise;

void setup() {
  size(640,640);
  ewidth = 200;
  eheight = 200;
  eangle = 0;
  wangle = 0;
  hangle = 0;
  changle = 0;
  einc = 0.01;
  winc = 0.01;
  hinc = 0.01;
  changleInc = 0.1;
  wnoise = 200;
  hnoise = 2000;
  znoise = 100;
  chnoise = 300;
  
  wnoiseInc = 0.01;
  hnoiseInc = 0.01;
  znoiseInc = 0.01;
  chnoiseInc = 0.1;
  
  midX = width/2;
  midY = height/2;
}

void draw() {
  
  if(frame < 350)
  {
    
  
  //background(0, 80);
  fill(0, 40);
  rect(0, 0, width, height);
  eangle += einc;
  //wangle += winc;
  //hangle += hinc;
  
  float wn = noise(wnoise);
  wangle += map(wn, 0, 1, -0.05, 0.05);
  wnoise += wnoiseInc;
  
  float hn = noise(hnoise);
  hangle += map(hn, 0, 1, -0.05, 0.05);
  hnoise += hnoiseInc;
  
  float zn = noise(znoise);
  zangle += map(zn, 0, 1, -0.03, 0.03);
  znoise += znoiseInc; 
  
  float chn = noise(chnoise);
  changle += map(chn, 0, 1, -0.2, 0.2);
  changle += chnoiseInc;
  
  
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
  ellipse(0, 0, ewidth, eheight);
  popMatrix();
}

void drawReferencePoint()
{
  
  fill(255, 128, 128, 200);
  stroke(50);
  pushMatrix();
  translate(midX, midY);
  
  float x = cos(eangle) * (ewidth / 2);
  float y = sin(eangle) * (eheight / 2);
  
  ellipse(x, y, 10, 10);
  popMatrix();
}

void drawOscilatingEllipse(float p_width, float p_height, int p_index){
  colorMode(HSB, 255);
  fill(changle, 128, 200, 2);
  stroke(40, 150, 200, 80 / (0.9 * (p_index + 1)));
  strokeWeight(2);
  pushMatrix();
  translate(midX, midY);
  rotate(zangle);

  
  float widthRadius = ewidth + (cos(wangle) * p_width / 2);  
  float heightRadius = eheight + (sin(hangle) * p_height / 2);  
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
  
  float widthRadius = ewidth + (cos(wangle) * ewidth / 2); 
  float heightRadius = eheight + (sin(hangle) * ewidth / 2);
  float x = cos(eangle) * (widthRadius / 2);
  float y = sin(eangle) * (heightRadius / 2);
  
  
  ellipse(x, y, 10, 10);
  popMatrix();
}


