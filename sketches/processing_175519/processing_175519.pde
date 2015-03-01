
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/175413*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
float ewidth;
float eheight;
float eangle;
float wangle;
float hangle;
float einc, winc, hinc;
float hnoise, wnoise;
float hnoiseInc, wnoiseInc;
float midX, midY;

void setup() {
  smooth();
  size(640,640);
  ewidth = 200;
  eheight = 200;
  eangle = 0;
  wangle = 0;
  hangle = 0;
  einc = 0.01;
  winc = 0.01;
  hinc = 0.01;
  wnoise = 200;
  hnoise = 2000;
  wnoiseInc = 0.01;
  hnoiseInc = 0.001;
  midX = width/2;
  midY = height/2;
}

void draw() {
  fill(0, 20);
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
  
  
  //drawReferenceEllipse();
  //drawReferencePoint();
  
  float minRadius = height/7;
  float maxRadius = height * 2;
  drawOscilatingEllipses(8, minRadius, maxRadius);
  //drawOscilatingEllipseReferencePoint();
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
  fill(240, 128, 200, 3);
  stroke(40, 150, 200, 50 / (0.4 * (p_index + 1)));
  strokeWeight(1.5);
  pushMatrix();
  translate(midX, midY);
  
  float widthRadius = ewidth + (cos(wangle) * p_width / 3);  
  float heightRadius = eheight + (sin(hangle) * p_height / 3);  
  ellipse(0, 0, widthRadius, heightRadius);
  popMatrix();  
}

void drawOscilatingEllipses(float p_numEllipses, float p_minRadius, float p_maxRadius)
{
  float radiusIncrement = (p_maxRadius - p_minRadius) / p_numEllipses;
  for(int i = 0; i < p_numEllipses; i++)
  {
    drawOscilatingEllipse(1.5 * (p_minRadius + radiusIncrement * i), 1.5 * (p_minRadius + radiusIncrement * i), i);
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

