
PImage ringpop;
int numObjects = 12;
int centerX = 150;
int centerY = 150;
int distance = 75;


void setup()
{
  size(300, 300);
  ringpop= loadImage("ringpop.png");
  imageMode(CENTER);
  rectMode(CENTER);
  // noLoop();
}

void draw()
{
  background(random(255), random(255), random(255));
  float angleObject = TWO_PI/numObjects;

  for (int i=0; i<numObjects;i++)
  {
    float posX=centerX+distance *sin(angleObject*i+frameCount*.02);
    float posY=centerY+distance *cos(angleObject*i+frameCount*.02);

    pushMatrix();
    translate(posX, posY);
    rotate((numObjects-i)*angleObject);
    image(ringpop, 0, 0);
    popMatrix();
  }
}


