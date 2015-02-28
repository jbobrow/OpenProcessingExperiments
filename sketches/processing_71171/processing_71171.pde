
PImage img1;
PImage img2;

void setup()
{
  size(500, 500);
  noStroke();
  smooth();
  background(0);
  ellipseMode(CENTER);
  img1 = loadImage("thingy.png");
  img2 = loadImage("thingy2.png");
}

void draw()
{
  fill(0, 0, 0, 30);
  rect(0, 0, width, height);
  sweetLines1(30, 15, 16, -0.5);
  sweetLines1(50, 10, 12, 1);
  spinnyThingy(12, 0.2, img2);
  sweetLines1(80, 6, 8, (-5/4));
  sweetCircles1(100, 20, width/2 - 30, 5);
  spinnyThingy(10, -0.5, img1);
  sweetCircles2(130, 16, 1, 60, 5/2);
  sweetCircles2(150, 18, -1, 0, 4);
  sweetCircles2(200, 15, 1, -50, 3);
  sweetCircles1(255, 10, width/4, 2);
}

void sweetCircles1(int fillc, int numO, float d, float divv)
{
  fill(fillc);
   
  int cX = width/2;
  int cY = height/2;
  int numObjects = numO;
  float distance = d;
  float angle = 0;
  float angleObject = 360/numObjects;
 
  for (int i = 0; i < numObjects; i++)
  {
    angle = frameCount*(i+1)/divv;
    float posX = cX + distance*cos(radians(angleObject*i + angle));
    float posY = cY + distance*sin(radians(angleObject*i + angle));
     
    //object
    ellipse(posX, posY, 10, 10);
  }
}

void sweetCircles2(int fillc, int numO, float mul, int offset, float divv)
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

void sweetLines1(int strooke, int strookeWeight, int numO, float mul)
{
  stroke(strooke);
  strokeWeight(strookeWeight);
   
  int cX = width/2;
  int cY = height/2;
  int numObjects = numO;
  float angle = frameCount*mul;
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

void spinnyThingy(int numO, float divv, PImage img)
{   
  int cX = width/2;
  int cY = height/2;
  int numObjects = numO;
  float distance = -10;
  float angle = 0;
  float angleObject = 360/numObjects;
 
  for (int i = 0; i < numObjects; i++)
  {
    angle = frameCount/divv;
    pushMatrix();
    translate(cX, cY);
    rotate(radians(i*angleObject + angle));
    //float posX = cX + distance*cos(radians(angleObject*i + angle));
    //float posY = cY + distance*sin(radians(angleObject*i + angle));
     
    //object
    image(img, 0, 0);
    
    popMatrix();
  }
}

