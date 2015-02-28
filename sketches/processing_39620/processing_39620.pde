
PImage img;
PImage pic;
PImage more;
PImage blu;

void setup()
{
  size(500, 500);
  img = loadImage("ColoredCircles.png");
  pic = loadImage("Circle2.png");
  more = loadImage("Circles3.png");
  blu = loadImage("Circle4.png");
  background(255);
  smooth();
 
}

int numObjects = 90;
int centerX = 400;
int centerY = 400;
int distance = 70;
/*
void draw()
{
  for (int i=0; i<numObjects; i++)
  {
    float posX=centerX + distance*sin(TWO_PI/numObjects*i);
    float posY=centerY + distance*cos(TWO_PI/numObjects*i);
    ellipse(posX, posY, 10, 10);
  }
}
*/

void draw()
{
  //divide the circle 360 degrees = 2*PI = TWO_PI
  //according to the number of objects
  float angleObject = TWO_PI/numObjects;
  
  for (int i=0; i<numObjects; i+=3)
  {
    //the sin(angle) cos(angle) has to be multiplied by the distance
    //from the center because trigonometric functions assume a circle with radius r
    //centerX and centerY is the offset from the top left corner
    float posX=centerX + distance*sin(angleObject*i+frameCount*0.01); //(TWO_PI/angleObject*i); 
    float posY=centerY + distance*cos(angleObject*i+frameCount*0.01); //(TWO_PI/angleObject*i); //
    
    posX=centerX + distance*4*sin(angleObject*i+frameCount*0.04);
    posY=centerY + distance*4*cos(angleObject*i+frameCount*0.04);
    
   // posX=centerX + distance*8*sin(angleObject*i+frameCount*0.03);
   // posY=centerY + distance*8*cos(angleObject*i+frameCount*0.03);
    
     pushMatrix();
   translate(200, 60);
   scale(1.3);
   rotate(radians(40));
   image(more, posX, posY);
   popMatrix();
    
  //  pushMatrix();
    translate(200, 10);
    scale(.9);
    rotate(radians(30));
    image(img, posX, posY);
  //  popMatrix();
   
   
   
   pushMatrix();
   translate(200, 40);
   scale(1.1);
   rotate(radians(40));
   image(pic, posX, posY);
   popMatrix();
   
   pushMatrix();
   translate(200, -100);
   scale(1.5);
   rotate(radians(60));
   image(blu, posX, posY);
   popMatrix();
   
  }
  
}



