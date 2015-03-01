
float zEnd, zTop;
int Eye = 50;
float[] z = new float[Eye];
float[][] pulsEye = new float[Eye][2];
float[] amplifEye= new float[Eye];
float[] posX= new float[Eye];
float[] posY= new float[Eye];
 
float deltaPulsDiv = PI/512;
float pulsDiv = 0;
float div = 0;



void setup() 
{
  size(500,500);
  background(0);
 
  zEnd = 0;
  zTop = -100;
   
   
  for (int i=0;i<Eye; i++) 
  {
    z[i] = random(zTop);
    posX[i] = width/2 + random(-div,div);
    posY[i] = height/2 + random(-div,div);
    amplifEye[i] = random(50);
    pulsEye[i][0] = random(6*PI);
    pulsEye[i][1] = random(6*PI);
  }
}
 
void draw() 
{
  background(0);
 
  int m = millis();
  
  pulsDiv += deltaPulsDiv;
  div = (width/2)*sq(sin(pulsDiv/2));
  
  for (int i=0; i<Eye; i++) {
    drawEye(posX[i], posY[i], z[i], pulsEye[i][0], pulsEye[i][1],amplifEye[i]);
    z[i] += 0.5;
    if (z[i] > zEnd) {
      z[i] = zTop;
      posX[i] = mouseX + random(-div,div);
      posY[i] = mouseY + random(-div,div);
      pulsEye[i][0] = random(6*PI)+m/2000;
      pulsEye[i][1] = random(6*PI)+m/2000;
      amplifEye[i] = random(mouseX/4);
    }
  }
}
 
void drawEye(float xPos, float yPos, float zPos, float pulsX, float pulsY, float amp)
{
  pushStyle();
  float eyeSize;
  eyeSize = 200*(zPos-zTop)/(zEnd-zTop);
 
  fill(255,255*(1-eyeSize/150));
  stroke(10,255*(1-eyeSize/150));
 
  float xEye, yEye;
  xEye = xPos + amp*cos(pulsX*eyeSize/100);
  yEye = yPos + amp*sin(pulsY*eyeSize/100);
  ellipse(xEye, yEye, eyeSize, eyeSize);
 
  pushStyle();
  fill(0, 255*(1-eyeSize/150));
  noStroke();
  ellipse(xEye, yEye, eyeSize/2, eyeSize/2);
  popStyle();
  
  pushStyle();
  noStroke();
  fill(255,255*(1-eyeSize/150));
  ellipse(xEye - eyeSize/10, yEye - eyeSize/10, eyeSize/8, eyeSize/8);
  popStyle();
  
  popStyle();
}
