
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float a=600;

void setup()
{
  size(600, 600);
}

void draw()
{
  if (mousePressed) rectRandom();
  else rectMoving();
}

void rectRandom()
{
  frameRate(10);
  noStroke();
  fill(238,221,195,150);
  rectMode(LEFT); // draws the rect from the center
  rect(0,0,width,height);
  
  // random number for a for the width
  float a=random(width); 
    
  stroke(126,87,150,150); 
  strokeWeight(25);
  noFill();
  rectMode(CENTER); // draws the rect from the center
  rect(width/2,height/2,a,a);
}

void rectMoving()
{
  frameRate(30);
  noStroke();
  fill(126,87,150,50);
  rectMode(LEFT); // draws the rect from the center
  rect(0,0,width,height);
  
  // counter decreasing the size of rect
  a-=24; 
    
  stroke(238,221,195); 
  strokeWeight(25);
  noFill();
  rectMode(CENTER); // draws the rect from the center
  rect(width/2,height/2,a,a);
  
  // re-setting the a value to origin
  if (a<-600) a=600;
}  

