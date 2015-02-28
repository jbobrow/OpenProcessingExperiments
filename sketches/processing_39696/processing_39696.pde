
PImage cube;
PImage ball;

void setup() {
  size(500, 500);
  //noLoop();
  noStroke();
  smooth();
  background(0);
  ellipseMode(CENTER);
  cube = loadImage("cube.png");
  ball = loadImage("ball.png");
}
 
float prevPosX = 1;
int numObjects = 10;
int centerX = 250;
int centerY = 250;
float distance = 50;
float posX = 1;
float posY = 1;
 
void draw() {
  background(0);
  //divide the circle 360 degrees = 2 * PI = TWO_PI
  //according to the number of objects
  float angleObject = TWO_PI/numObjects;
 
  for (int i=0;i<numObjects;i++)
  {
    //the sin(angle) cos(angle) has to be
    //multiplied by the distance from the center
    //because trigonometric functions assume a circle with radius=1
    //centerX and centerY is the offset from the top left corner
    for(float c=0;c<200;c+=15)
    {
    
    distance = 200*sin(c+float(frameCount)*0.01);
    posX=centerX + distance *sin(angleObject*i+ frameCount*0.01);
    posY=centerY + distance *cos(angleObject*c );
    float changeInX = prevPosX-posX;
    if ( i == 3)
    {
     image(cube, posX, posY,(abs((distance/300)*20)+10),(abs((distance/300)*20)+10)); 
    }
    else
    { 
    image(ball, posX, posY,(abs((distance/300)*20)+10),(abs((distance/300)*20)+10));
    }
    prevPosX = posX;
    }

    
    //you can have a circular motion if the starting angle
    //is linked to a variable (0.01 is just a divider defining speed)
    //angleObject*i+frameCount*0.01
  }
}

