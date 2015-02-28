
int [] shapeArray = {40, 50, 90, 120, 150};
int [] colorArray = new int [2];
int [] speedArray = {1, 1, 1, 1, 1};

void setup()
{
  size(250, 200);
  background(255);
}
void draw()
{
  background(255);
  if(mouseX < 20 || mouseX > 230 || mouseY > 180)
  {
    colorArray[0] = color(random(255), random(255), random(255));
    colorArray[1] = color(random(255), random(255), random(255));
    
    frameRate(100);
    fill(colorArray[0]);
    ellipse(30, shapeArray[0], 15, 15);
    ellipse(shapeArray[1], 60, 15, 15);
    ellipse(shapeArray[2], 80, 15, 15);
    ellipse(50, shapeArray[3], 15, 15);
    ellipse(160, shapeArray[4], 15, 15);
    
    shapeArray[0] = shapeArray[0] + speedArray[0];
    shapeArray[1] = shapeArray[1] + speedArray[1];
    shapeArray[2] = shapeArray[2] + speedArray[2];
    shapeArray[3] = shapeArray[3] + speedArray[3];
    shapeArray[4] = shapeArray[4] + speedArray[4];
    
    if (shapeArray[0] > 185 || shapeArray[0] < 0)
    speedArray[0] = speedArray[0]*-1;
    if (shapeArray[1] > 235 || shapeArray[1] < 0)
    speedArray[1] = speedArray[1]*-1;
    if (shapeArray[2] > 235 || shapeArray[2] < 0)
    speedArray[2] = speedArray[2]*-1;
    if (shapeArray[3] > 185 || shapeArray[3] < 0)
    speedArray[3] = speedArray[3]*-1;
    if (shapeArray[4] > 185 || shapeArray[4] < 0)
    speedArray[4] = speedArray[4]*-1;
  }
}
