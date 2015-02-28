
void setup()
{
  size( 1250, 700 );
  background( 0, 0, 0);
  smooth();
  frameRate(20);
}
 
void draw()
{
  noCursor();
  noStroke();
  fill(0,10);
  rect(0,0,1250,700);
  strokeWeight(100);
  strokeCap(ROUND);
  stroke(255,0,0,50);
  line(0,mouseY,mouseX,mouseY);
  stroke(0,255,0,50);
  line(1300,mouseY,mouseX,mouseY);
  stroke(0,0,255,50);
  line(mouseX,0,mouseX,mouseY);
  stroke(255,255,0,50);
  line(mouseX,700,mouseX,mouseY);
  fill(255,255,255);
  noStroke();
  ellipse(mouseX,mouseY,100,100);
}
