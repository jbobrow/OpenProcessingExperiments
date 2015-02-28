
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
  frameRate(60);
  background(0);
  smooth();
  noStroke();
  imageMode(CENTER);
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw()
{
  background(255, 211, 80);
  
//Mandala Parts that rotate
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
    //confetti
    //white
    fill(255,200, 255, 200);
    ellipse(100, 100, 20, 20);
    //blue
    fill(95, 158, 196,200);
    ellipse(-80, -80, 35, 35);
    //pink
    fill(216, 72, 111,200);
    ellipse(90, 90, 15, 15);
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





