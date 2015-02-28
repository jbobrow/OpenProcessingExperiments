
void setup() {
  size(900, 900);
  //noLoop();
  noStroke();
  smooth();
  background(0);
  ellipseMode(CENTER);
  girl = loadImage("girl.png");
  machinearm = loadImage("arm.png");
  gun1 = loadImage("pinkgun.png");
  gun2 = loadImage("greengun.png");
  bg = loadImage("background.png");
  candy = loadImage("candy.png");
}
 
PImage girl, machinearm, gun1, gun2, candy, bg; 
int numObjects = 10;
int centerX = 450;
int centerY = 450;
int distance = 100;

 
void draw() {
  background(random(100, 255), 100, random(100, 255));
  image(bg, 120, 100);
  //divide the circle 360 degrees = 2 * PI = TWO_PI
  //according to the number of objects
  float angleObject = TWO_PI/numObjects;
  
  for (int i=0;i<numObjects;i++)
  {
    //the sin(angle) cos(angle) has to be
    //multiplied by the distance from the center
    //because trigonometric functions assume a circle with radius=1
    //centerX and centerY is the offset from the top left corner
    float posX=centerX + distance *sin(angleObject*i+frameCount*0.15);
    float posY=centerY + distance *cos(angleObject*i+frameCount*0.15);
    drawEllipse(posX, posY);
    drawEllipse(posX, posY);
    drawEllipse(posX, posY);
    pushMatrix();
    translate(posX, posY);
    rotate((numObjects-i)*angleObject);
      pushMatrix();
      rotate(radians(45));
      scale(0.25);
      image(gun1, 50, 50);
      popMatrix();
      //
      pushMatrix();
      rotate(radians(150));
      scale(0.5);
      image(gun2, 250, 200);
      popMatrix();
      //
      pushMatrix();
      rotate(radians(350));
      image(girl, 0, 0);
      popMatrix();
      //
      pushMatrix();
      rotate(radians(100));
      scale(1.5);
      image(machinearm, 150, 50);
      popMatrix();
      //
    
    popMatrix();
    
    
    //you can have a circular motion if the starting angle
    //is linked to a variable (0.01 is just a divider defining speed)
    //angleObject*i+frameCount*0.01
  }
}

void drawEllipse(float Xin, float Yin) 
{
   float X = Xin;
   float Y = Yin;
   float siz = random(10,100);
   fill(255,255,255,50);
   ellipse(X, Y, siz, siz);
}


