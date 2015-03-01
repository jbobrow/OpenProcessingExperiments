
float angleSteps = PI / 15;

void setup ()
{
  size (600, 600);
  smooth();
}

void draw ()
{

  background (#57385c);
  
  if (mousePressed == true)
  {
    angleSteps = map (mouseX, 0, width, 0, PI);
  }
  
  stroke (#ffedbc, 200);
  drawBranch (width/2, height, 130, -PI/2);
}

void drawBranch (float startX, float startY, float branchLength, float angle)
{
  float endX = startX + cos (angle) * branchLength;
  float endY = startY + sin (angle) * branchLength;
  
  line (startX, startY, endX, endY);
  
  branchLength = branchLength * 0.75;
  
  if (branchLength > 3)
  {
    drawBranch (endX, endY, branchLength, angle + angleSteps);
    drawBranch (endX, endY, branchLength, angle - angleSteps);
  }
}

