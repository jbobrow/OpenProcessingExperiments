
PImage bgImage;
PImage leaf1;
PImage leaf2;

void setup() {
  size(790, 770);
  bgImage = loadImage("fallgirlrotation.JPG");
  leaf1 = loadImage("leaf1.png");
  leaf2 = loadImage("leaf2.png");
  //noLoop();
  noStroke();
  smooth();
  background(0);
  ellipseMode(CENTER);
  image(bgImage, 0, 0);
}
 
 
int numObjects = 10;
int centerX = 400;
int centerY = 400;
float distance = 50;
float leafDistance = 350;
float leaf2Distance = 250;
float angle = 0;
 
void draw() {
  //background(0);
  image(bgImage, 0, 0);
  //divide the circle 360 degrees according to the number of objects
  float angleObject = 360/numObjects;
 
  for( int j = 0; j < 15; j++)
  {
    angle = frameCount*j/2;
    float posLX=centerX + leafDistance *cos( radians(angleObject*j + angle) );
    float posLY=centerY + leafDistance *sin( radians(angleObject*j + angle) );
    image(leaf1, posLX-100, posLY-100);
  }
  
  for(int k = 0; k < 10; k++)
  {
    angle = frameCount*k;
    float posL2X=centerX + leaf2Distance *cos( radians(angleObject*k + angle) );
    float posL2Y=centerY + leaf2Distance *sin( radians(angleObject*k + angle) );
    image(leaf2, posL2X-40, posL2Y-70);
  }

  for (int i=0;i<numObjects ;i++)
  {
    angle = frameCount;

    distance = sin(radians(frameCount))*500;
    
    //the sin(angle) cos(angle) has to be
    //multiplied by the distance from the center
    //because trigonometric functions assume a circle with radius=1
    //centerX and centerY is the offset from the top left corner
    //remember to convert in radians
    float posX=centerX + distance *sin( radians(angleObject*i + angle) );
    float posY=centerY + distance *cos( radians(angleObject*i + angle) );
    
    fill(255,255,255,100);
    ellipse(posX, posY, 10, 10);
    
    triangle(posX, posY, 400,400, 400,450);
    
    fill(252,215,23,100);
    triangle(posX+100, posY, 375,400, 425,400);
    
    fill(227,95,7,150);
    triangle(posX-150, posY, 375,400, 425,400);
    
    distance = sin(radians(frameCount))*200;
    posX=centerX - distance *sin( radians(angleObject*i + angle) );
     posY=centerY - distance *cos( radians(angleObject*i + angle) );
    ellipse(posX, posY, 20, 20);
    
  }
}

