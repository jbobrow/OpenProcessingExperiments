
PImage gobs, nerd, bottle, juice, wonka;
int numObjects = 10;
int centerX = 250;
int centerY = 250;
int distance = 75;
 
 
void setup()
{
  size(500, 500);
  gobs=loadImage("GOBSTOPPER.png");
  nerd=loadImage("Nerd.png");
  bottle=loadImage("BOTTLECAP.png");
  wonka=loadImage("HAT.png");
  juice = loadImage("JUICE.png");
  
  
  imageMode(CENTER);
  frameRate(15);
  // noLoop();
}
 
void draw()
{
  background(random(255), random(255), random(255));
  float angleObject = TWO_PI/numObjects;
  for (int i=0; i<numObjects;i++)
  {
    float posX=centerX+distance *sin(angleObject*i+frameCount*.2);
    float posY=centerY+distance *cos(angleObject*i+frameCount*.2);
 
    pushMatrix();
    translate(posX, posY);
    rotate((numObjects-i)*angleObject);
    pushMatrix();
    rotate(radians(45));
   image(gobs, 0, 0);
    popMatrix();
 
pushMatrix();
rotate(radians (45));
 image(nerd, 100, 100, 50, 50);
 popMatrix();
    popMatrix();
  }
  for (int i=0; i<numObjects;i++)
  {
    float posX=centerX+distance *sin(angleObject*i+frameCount*.03);
    float posY=centerY+distance *cos(angleObject*i+frameCount*.03);
 
    pushMatrix();
    translate(posX, posY);
   
    rotate(angleObject*(numObjects-i));

 
    image(juice, 25, 25, 100, 100);
    
     posX=centerX+distance *sin(angleObject*i-frameCount*.05);
     posY=centerY+distance *cos(angleObject*i-frameCount*.05);

    image(bottle, 200, 100);
    popMatrix();
    
    pushMatrix();
    translate(250, 250);
    rotate(frameCount*.01%TWO_PI);
    image(wonka, 0, 0,wonka.width*1,wonka.height*1);
    popMatrix();

  }
 
 
}


