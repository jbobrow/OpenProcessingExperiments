
int centerX;
int centerY;

int numObjects;
float distance;
int growDistance;
float angle;

PImage o1;
PImage o2;
PImage o3;
PImage o4;
PImage o5;


void setup() {
  size(1000, 1000);
  //noLoop();
  noStroke();
  //smooth();
  background(0);
  ellipseMode(CENTER);


  numObjects = 20;
  distance = 50;
  angle = 0;

  centerX = width/2;
  centerY = height/2;
  
  o1 = loadImage("o1.png");
  o2 = loadImage("o2.png");
  o3 = loadImage("o3.png");
  o4 = loadImage("o4.png");
  o5 = loadImage("o5.png");
}
 
 
 
void draw() {
  lights();
  background(0);
  //image(o1, 0, 0);
  //divide the circle 360 degrees according to the number of objects
  float angleObject = 360/numObjects;
 
 
  for (int i=0;i<numObjects ;i++)
  {
    //you can have a circular motion if you sum the same angle to all objects
    //angle = frameCount;
    //and the speed can be also linked to the object number
    //angle = frameCount*i / 2;
 
    //fun with trigonometry and oscillations
    distance = sin(radians(frameCount))*150;
 
    //the sin(angle) cos(angle) has to be
    //multiplied by the distance from the center
    //because trigonometric functions assume a circle with radius=1
    //centerX and centerY is the offset from the top left corner
    //remember to convert in radians
    float posX=centerX + distance *cos( radians(angleObject*i + angle) );
    float posY=centerY + distance *sin( radians(angleObject*i + angle) );
    image(o1, posX, posY, 90, 90);

//    ellipse(posX, posY, 30, 30);
 
  }
  
  for (int j=0; j<numObjects; j++) {
    //you can have a circular motion if you sum the same angle to all objects
    angle = frameCount;
    //and the speed can be also linked to the object number
    //angle = frameCount*i / 2;
    float posX=centerX + 130 *cos( radians(angleObject*j + angle) );
    float posY=centerY + 130 *sin( radians(angleObject*j + angle) );
    image(o2, posX, posY, 90, 90);

  }
  
  for (int k=0; k<numObjects; k++) {
    //you can have a circular motion if you sum the same angle to all objects
    angle = frameCount;
    //and the speed can be also linked to the object number
    //angle = frameCount*i / 2;
    float posX=centerX + 270 *cos( radians(angleObject*k + angle) );
    float posY=centerY + 270 *sin( radians(angleObject*k + angle) );
    image(o3, posX-40, posY-40, 200, 200);

  }
  
  for (int k=0; k<numObjects; k++) {
    //you can have a circular motion if you sum the same angle to all objects
    angle = frameCount;
    //and the speed can be also linked to the object number
    //angle = frameCount*i / 2;
    float posX=centerX + 370 *cos( radians(angleObject*k + angle) );
    float posY=centerY + 370 *sin( radians(angleObject*k + angle) );
    image(o4, posX-60, posY-60, 200, 200);

  }
  
  for (int k=0; k<numObjects; k++) {
    //you can have a circular motion if you sum the same angle to all objects
    angle = frameCount;
    //and the speed can be also linked to the object number
    //angle = frameCount*i / 2;
    float posX=centerX + 470 *cos( radians(angleObject*k + angle) );
    float posY=centerY + 470 *sin( radians(angleObject*k + angle) );
    image(o5, posX-80, posY-80, 200, 200);

  }
   for (int k=0; k<numObjects; k++) {
    //you can have a circular motion if you sum the same angle to all objects
    angle = frameCount;
    //and the speed can be also linked to the object number
    //angle = frameCount*i / 2;
    float posX=centerX + 570 *cos( radians(angleObject*k + angle) );
    float posY=centerY + 570 *sin( radians(angleObject*k + angle) );
    image(o1, posX-100, posY-100, 200, 200);

  }
}

