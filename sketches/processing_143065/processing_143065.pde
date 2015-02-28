
void setup()
{
  size(600, 600);
  background(#325A7D);
  frameRate(10);
}
 
void draw()
{
  noStroke();
  fill(#325A7D,150);
  rectMode(LEFT); // draws the rect from the center
  rect(0,0,width,height);
   
  // random number for a for the width
  float a=random(width);
     
  stroke(255);
  strokeWeight(25);
  noFill();
  rectMode(CENTER); // draws the rect from the center
  rect(width/2,height/2,a,a);
}

