
PImage b,j;


void setup() {
  b = loadImage("babies.png");
  j = loadImage("jonbenet.png");
  size(500, 500);
  //noLoop();
  noStroke();
  smooth();
  background(0);
  imageMode(CENTER);
}
 
 
int numObjects = 10;
int centerX = 250;
int centerY = 250;
int distance = 50;
 
void draw() {
  background(0);
  //divide the circle 360 degrees = 2 * PI = TWO_PI
  //according to the number of objects
  float angleObject = TWO_PI/numObjects;
     pushMatrix();
     translate(width/2, height/2);
     rotate(frameCount*.02*PI);

     image(j, 0, 0);
     popMatrix();
     
  for (int i=0;i<numObjects;i++)
  {
    //the sin(angle) cos(angle) has to be
    //multiplied by the distance from the center
    //because trigonometric functions assume a circle with radius=1
    //centerX and centerY is the offset from the top left corner
    float posX=centerX + distance *sin(angleObject*i+frameCount*.02);
    float posY=centerY + distance *cos(angleObject*i+frameCount*.02);
   pushMatrix();
   translate(posX,posY);
   rotate(angleObject*(numObjects-i));
    image(b, 100, 0);
    popMatrix();
    
    //you can have a circular motion if the starting angle
    //is linked to a variable (0.01 is just a divider defining speed)
    //angleObject*i+frameCount*0.01
  }
}

