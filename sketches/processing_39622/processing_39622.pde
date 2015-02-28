
PImage yoga, yogaleotard, treepose, doggie;
int numObjects = 12;
int centerX = 400;
int centerY = 400;
int distance = 75;


void setup()
{
  size(800, 800);
  yoga=loadImage("Bones.png");
  yogaleotard=loadImage("yogaleotard.png");
  treepose=loadImage("treepose.png");
  doggie = loadImage("doggie.png");
  imageMode(CENTER);
  frameRate(30);
  // noLoop();
}

void draw()
{
  background(random(150, 255), random(150, 255), random(150, 255));
  float angleObject = TWO_PI/numObjects;
  for (int i=0; i<numObjects;i++)
  {
    float posX=centerX+distance *sin(angleObject*i-frameCount*.2);
    float posY=centerY+distance *cos(angleObject*i-frameCount*.2);

    pushMatrix();
    translate(posX, posY);
    rotate((numObjects-i)*angleObject);
    pushMatrix();
    rotate(radians(230));
    image(treepose, 0, 0);
    popMatrix();

pushMatrix();
rotate(PI);
 image(yoga, 320, 100);
 popMatrix();
    popMatrix();
  }
  for (int i=0; i<numObjects;i++)
  {
    float posX=centerX+distance *sin(angleObject*i+frameCount*.2);
    float posY=centerY+distance *cos(angleObject*i+frameCount*.2);

    pushMatrix();
    translate(posX, posY);
    rotate((numObjects-i)*angleObject);
   

    image(yogaleotard, 200, 0);
    image(doggie, 250, 100);
    popMatrix();
  }


}


