
//global variables
float posX = 0;
float posY = 0;

void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  frameRate(7);
  //background(0, 0, random(100, 256), 100);

}

void draw()  
{
  //for transparent black background
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  fill(255, 255, 255);
  //some variables  
  float myDiameter  = random(5, 100);
  float myDiameterB = random(5, 100);
  float dx = mouseX - posX;
  float dy = mouseY - posY;
  
  posX += dx/5; //lowering the denomenator makes it faster
  posY += dy/5;
  
 ellipse(posX, posY, myDiameter, myDiameter);
//if the mouse is pressed random colored ellipses are produced
if(mousePressed == true)
{
  fill(random(256), random(256), 0);
  ellipse(posY, posX, myDiameterB, myDiameter);
  rect(random(500)+posY, random(500)+posX, random(10, 100), random(50, 100));
}
{
ellipse(posX, posY, myDiameter, myDiameterB);

}
}

           
                                                
