
void setup()
{
  noCursor();
  size( 1300, 700 );
  background( 0, 0, 0);
  smooth();
  frameRate(60);
}
 
void draw()
{
  noStroke();
  fill(0,0,0,80);
  rect(0,0,1300,700);
  strokeWeight(5);
  stroke(255,255,153);
  noFill();
  rect(mouseX-random(80,120),mouseY-random(80,120),200,200,50);
  
  if(mousePressed)
  {
  noStroke();
  fill(255,255,153);
  rect(0,0,1300,700);
  strokeWeight(40);
  stroke(0,0,0);
  noFill();
  rect(mouseX-100,mouseY-100,200,200,50);
  }
}
