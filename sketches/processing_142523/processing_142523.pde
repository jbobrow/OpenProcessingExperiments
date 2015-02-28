
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

void setup()
{
  size(600, 600);
  background(149,15,22);
  frameRate(10);
}

void draw()
{
  noStroke();
  fill(149,15,22,150);
  rectMode(LEFT); // draws the rect from the center
  rect(0,0,width,height);
  
  // random number for a for the width
  float a=random(width); 
    
  stroke(148,200,213); 
  strokeWeight(25);
  noFill();
  rectMode(CENTER); // draws the rect from the center
  rect(width/2,height/2,a,a);
}
