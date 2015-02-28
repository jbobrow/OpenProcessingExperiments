
void setup()
{
  size(500, 500);
  noStroke();
  smooth();
  background(0);
  ellipseMode(CENTER);
}

void draw()
{
  fill(0, 0, 0, 30);
  rect(0, 0, width, height);
  sweetLines2();
  sweetLines1();
  sweetLines3();
  sweetCircles3();
  sweetCircles2(130, 16, 1, 60, 5/2);
  sweetCircles2(150, 18, -1, 0, 4);
  sweetCircles2(200, 15, 1, -50, 3);
  sweetCircles1();
}

void sweetCircles1()
{
  fill(255);
  
  int cX = width/2;
  int cY = height/2;
  int numObjects = 10;
  float distance = width/4;
  float angle = 0;
  float angleObject = 360/numObjects;

  for (int i = 0; i < numObjects; i++)
  {
    angle = frameCount*(i+1)/2;
    float posX = cX + distance*cos(radians(angleObject*i + angle));
    float posY = cY + distance*sin(radians(angleObject*i + angle));
    
    //object
    ellipse(posX, posY, 10, 10);
  }
}

void sweetCircles2(int fillc, int numO, int mul, int offset, int divv)
{
  fill(fillc);
  
  int cX = width/2;
  int cY = height/2;
  int numObjects = numO;
  float distance;
  float angle = frameCount*mul;
  float angleObject = 360/numObjects;
  
  for (int i = 0; i < numObjects; i++)
  {
    distance = sin(radians(frameCount+offset))*width/divv;
    float posX = cX + distance*cos(radians(angleObject*i + angle));
    float posY = cY + distance*sin(radians(angleObject*i + angle));
    
    //object
    ellipse(posX, posY, 10, 10);
  }
}

void sweetCircles3()
{
  fill(100);
  
  int cX = width/2;
  int cY = height/2;
  int numObjects = 20;
  float distance = width/2 - 30;
  float angle;
  float angleObject = 360/numObjects;

  for (int i = 0; i < numObjects; i++)
  {
    angle = frameCount*(i+1)/5;
    float posX = cX + distance*cos(radians(angleObject*i + angle));
    float posY = cY + distance*sin(radians(angleObject*i + angle));
    
    //object
    ellipse(posX, posY, 10, 10);
  }
}

void sweetLines1()
{
  stroke(50);
  strokeWeight(10);
  
  int cX = width/2;
  int cY = height/2;
  int numObjects = 12;
  float angle = frameCount;
  float angleObject = 360/numObjects;
  
  for (int i = 0; i < numObjects; i++)
  {
    pushMatrix();
    translate(cX, cY);
    rotate(radians(i*angleObject + angle));
    line(0, 0, height, width);
    popMatrix();
  }
  
  noStroke();
}

void sweetLines2()
{
  stroke(30);
  strokeWeight(15);
  
  int cX = width/2;
  int cY = height/2;
  int numObjects = 16;
  float angle = -frameCount/2;
  float angleObject = 360/numObjects;
  
  for (int i = 0; i < numObjects; i++)
  {
    pushMatrix();
    translate(cX, cY);
    rotate(radians(i*angleObject + angle));
    line(0, 0, height, width);
    popMatrix();
  }
  
  noStroke();
}

void sweetLines3()
{
  stroke(80);
  strokeWeight(6);
  
  int cX = width/2;
  int cY = height/2;
  int numObjects = 8;
  float angle = -frameCount*5/4;
  float angleObject = 360/numObjects;
  
  for (int i = 0; i < numObjects; i++)
  {
    pushMatrix();
    translate(cX, cY);
    rotate(radians(i*angleObject + angle));
    line(0, 0, height, width);
    popMatrix();
  }
  
  noStroke();
}
