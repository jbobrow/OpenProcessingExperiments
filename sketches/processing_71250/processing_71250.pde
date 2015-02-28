


PImage img;
void setup() {
  size(700, 700);
  img = loadImage("egeometric.png");
  //noLoop();
  noStroke();
  smooth();
  background(0);
  ellipseMode(CENTER);
}

int numObjects = 30;
int centerX = 350;
int centerY = 350;
float distance = 50;
float angle = 0;

void draw() {
  //background(0);
  //fill(0, 0, 0, 10);
  // rect(0, 0, width, width);
  //divide the circle 360 degrees according to the number of objects
  fill(225);
  float angleObject = 360/numObjects;
  image(img, 0, 0, 700, 700);
  //image(img, 0, 0);
  int change=10;
  int opacity=60;
  tint(255, opacity+change%100);  // Apply transparency without changing color
  //image(img, 50, 0);
 
  for (int i=0;i<= numObjects ;i++)
  {
    //you can have a circular motion if you sum the same angle to all objects
    angle = frameCount;
    //and the speed can be also linked to the object number
    //angle = frameCount*i / 2;

    //fun with trigonometry and oscillations
    distance = sin(radians(frameCount))*350;

    //the sin(angle) cos(angle) has to be
    //multiplied by the distance from the center
    //because trigonometric functions assume a circle with radius=1
    //centerX and centerY is the offset from the top left corner
    //remember to convert in radians
    fill(0);
    float posX=centerX + distance *cos( radians(angleObject*i + angle) );
    float posY=centerY + distance *sin( radians(angleObject*i + angle) );
    ellipse(posX, posY, 30, 30);
  }
}


