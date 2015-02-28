
final static int NUM_NODES = 50;
final static float IMPULSE_MULTIPLIER = 0.6;
final static float DAMPING = 0.98;
final static float Y_SCALE = 1.0;
float nodeSpacing;

float[] yPos = new float[NUM_NODES];
float[] yVel = new float[NUM_NODES];

int softStart = 0;
int mouseStart = 0;

void setup () 
{
  size (900, 500);
  
  nodeSpacing = float(width) / (NUM_NODES - 1);

  
  for (int ii = 0; ii < NUM_NODES; ii++)
  {
    yPos[ii] = 0;
    yVel[ii] = 0;
  } 
  
  frameRate(60);
  smooth();
  background(80);
  noStroke();
}

void draw() 
{ 
  if(softStart == 0)
  {      
    if((mouseY < height / 2) && (mouseY > 0))
    {
      if (mouseStart == 2)
      {
        softStart = 1;
      }
      mouseStart = 1;
    }
    if(mouseY > height / 2)
    {
      if (mouseStart == 1)
      {
        softStart = 1;
      }
      mouseStart = 2;
    }
  }
  else
  {
    
    
    float tempYVel = 0;
    float resultantY = 0;
    float halfWidth = float(width) / 2;
    float proportionX = (mouseX - halfWidth) / halfWidth;
    float proportionYLeft, proportionYRight;
    if(proportionX < 0)
    {
      proportionYLeft = 0;
      proportionYRight = -proportionX;
    }
    else
    {
      proportionYLeft = proportionX;
      proportionYRight = 0;
    }
    yPos[0] = (mouseY - height/2) * (1 - proportionYLeft) * Y_SCALE;
    yPos[NUM_NODES - 1] = (-mouseY + height/2) * (1 - proportionYRight) * Y_SCALE;
   
    for (int ii = 1; ii < NUM_NODES - 1; ii++)
    {  
      resultantY = ((yPos[ii - 1] + yPos[ii + 1]) / 2) - yPos[ii];
      yVel[ii] += IMPULSE_MULTIPLIER * resultantY;
      yVel[ii] *= DAMPING;
    } 
  } 
  
  for (int ii = 1; ii < NUM_NODES - 1; ii++)
  { 
    yPos[ii] += yVel[ii];
  }
  
  background(255,238,147);
  fill(255,59,134);
  beginShape();
  vertex(0, height);
  vertex(0, yPos[0] + height /2);
  
  for (int ii = 0; ii < NUM_NODES; ii++)
  {
    curveVertex(nodeSpacing * ii, yPos[ii] + height /2);
  }
  curveVertex(width, yPos[NUM_NODES - 1] + height /2);
  vertex(width, height);
  endShape(CLOSE);
  
  /*
  for (int ii = 0; ii < NUM_NODES; ii++)
  {
    drawNode(nodeSpacing * ii, yPos[ii] + height /2);
  }*/
 
}

void drawNode(float x, float y)
{
  fill(0);
  stroke(0);
  ellipse(x, y, 7, 7);
}

