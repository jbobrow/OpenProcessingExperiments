
PImage img, img2, img3;


int centerX=400;
int centerY=400;
int numObjects= 6;
int numObjects2 = 24;
int distance = 80;
void setup()
{
  size(800, 800);
  img = loadImage("squ1.png");
  img2 =loadImage("cozypenguin.png");
  img3 =loadImage("cozychicken.png");
  frameRate(40);
  background(0);
  smooth();
  noStroke();
  imageMode(CENTER);

  //noLoop();
}

void draw()
{
  background(255, random(150,255), random(40,60));

  float angleObject = TWO_PI/numObjects;
  float angleObject2 = TWO_PI/numObjects2;
  for (int i= 0; i<numObjects2; i++)
  {
    //penguins 
    float posX = centerX+ distance*4* sin(angleObject2*i+frameCount*0.06); 
    float posY = centerY+ distance*4* cos(angleObject2*i+frameCount*0.06); 
    pushMatrix();
    translate(posX, posY);
    rotate(angleObject*i+radians(90)+frameCount*0.05);
    ellipse(100, 100, 20, 20);
    image (img2, 40, 40);
    popMatrix();
  }

  for (int i= 0; i<numObjects; i++)
  {
    float posX = centerX+ distance*3 * sin(angleObject2*i+frameCount*0.01); 
    float posY = centerY+ distance*3 * cos(angleObject2*i+frameCount*0.01); 

    //chickens
    posX = centerX+ distance*2.2 * cos(angleObject*i+frameCount*0.03); 
    posY = centerY+ distance *2.2 *sin(angleObject*i+frameCount*0.03);
    pushMatrix();
    translate(posX, posY);
    rotate(angleObject*i+radians(90)+frameCount*0.05);
    image(img3, 0, 0);
    popMatrix();

    //squirrels 
    posX = centerX+ distance * sin(angleObject*i+frameCount*0.04); 
    posY = centerY+ distance * cos(angleObject*i+frameCount*0.04); 
    pushMatrix();
    translate(posX, posY);
    rotate((1-angleObject*i)+radians(90)+frameCount*0.01);
    image (img, 0, 0);
    popMatrix();
  }

}


