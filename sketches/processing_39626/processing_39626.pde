
PImage img;

void setup()
{
  size(500,500);
  rectMode(CENTER);
  img = loadImage("turtle1.png");
frameRate(7);
smooth();
noStroke();

}

int numObjects = 10;
int centerX = 250;
int centerY = 250;
int distance = 100;

void draw(){
   background(229,234,164);

float angleObject = (TWO_PI/numObjects);

  for (int i =0; i<numObjects; i++)
  { 
   


  float posX=centerX + distance*sin(angleObject*i+frameCount*0.1);
  float posY=centerY + distance*cos(angleObject*i+frameCount*0.1);
    float posI=centerX - distance*sin(angleObject*i+frameCount*0.1);
  float posJ=centerY + distance*cos(angleObject*i+frameCount*0.1);
      float posK=centerX +( distance*2)*sin(angleObject*i+frameCount*0.1);
  float posH=centerY + (distance*2)*cos(angleObject*i+frameCount*0.1);
 pushMatrix();
 translate(posX,posY);
rotate(angleObject*i*frameCount*0.1);   
image(img,0,0,100,100);
rotate(angleObject*i+frameCount*0.1);
fill(105,165,164);
ellipse(0,0,20,20);

popMatrix();


pushMatrix();
translate(posI,posJ);
fill(97,99,130);
rotate(angleObject*i+frameCount*0.1);
ellipse(0,0,40,40);
popMatrix();

pushMatrix();
translate(posK,posH);
rotate(angleObject*i+frameCount*0.1);
fill(102,36,91);
rect(0,0,10,10);
popMatrix();




  }  
}


