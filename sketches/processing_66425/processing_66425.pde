
float d;
float xPos;
float yPos;
float xVel;
float yVel;
int currentColor = 0;
 

   // PImage = class, myImage = an object of 'PImage' class


void setup () {
  size(600,600);
  background(255);
PImage myImage = loadImage("ab.png"); 
image(myImage, 0, 0); // draw the image
  smooth();
  frameRate(60);
  fill(currentColor);
   
  d = random(40,120);
  xPos = random(d/2, width - (d/2));
  yPos = random(d/2, height - (d/2));
  xVel = random(-10,10);
  yVel = random(-5,5);
  

}
 
void draw () {
  noStroke();
  ellipse(xPos,yPos,d,d);
   
  xPos= xPos + xVel;
  yPos= yPos + yVel;
   
  
   if(xPos < (d/2)) {
     xVel = xVel*(-1);
     
   } else if(yPos < (d/2)) {
     yVel = yVel*(-1);

   } else if(xPos>width-(d/2)) {
     xVel= xVel*(-1);

   } else if(yPos>height-(d/2)) {
     yVel= yVel*(-1);

   } 
}


