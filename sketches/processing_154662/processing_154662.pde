
void setup ()
{
  size (500,500);
  smooth();
}

void draw ()
{
  background (#A75265);
  
  drawEye(width*1/5, height * 1/3.0);
  drawEye(width*4/5, height * 1/3.0);
}

void drawEye (float cx, float cy)
{
  float eyeCenterX = cx;
  float eyeCenterY = cy;
  
  float eyeBall = 100;
  float iris = 50;
  
  pushMatrix();
  translate (eyeCenterX, eyeCenterY);
  
  noStroke();
  fill (255);
  ellipse (0, 0, eyeBall, eyeBall);
  
  popMatrix();
  pushMatrix();
  
  float angle = atan2 (mouseY-eyeCenterY, mouseX - eyeCenterX);
  float maxDist = 200;
  float dis = dist (mouseX, mouseY, eyeCenterX, eyeCenterY);
  float r = map (dis, 0, maxDist, 0, eyeBall/2 - iris/2);
  
  if (r > eyeBall/2 - iris/2) r = eyeBall/2 - iris/2;
  
  float irisX = eyeCenterX + cos (angle)*r;
  float irisY = eyeCenterY + sin (angle)*r;
  
  
  translate (irisX, irisY);
  
  fill (#57385c);
  ellipse (0, 0, iris, iris);
  
  popMatrix();
}


