
void setup()
{
  size( 1300, 700 );
  background( 255, 255, 153);
  smooth();
  frameRate(7);
}
 
void draw()
{
  noStroke();
  fill(255,255,153,10);
  rect(0,0,1330,700);
  fill(random(200,255),random(100,155),random(100,155),120);
  ellipse(mouseX+(random(-300, 300)),mouseY+(random(-300, 300)),200,200);
}
