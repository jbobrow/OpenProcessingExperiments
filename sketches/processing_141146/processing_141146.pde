
void setup()
{
  size( 600, 600 );
  background(0);
  smooth();
  frameRate(60);
}
 
void draw()
{
  noStroke();
  fill(0,50);
  rect(0,0,1330,700);
  fill((abs(mouseY-300)*4),0,(abs(mouseY-300)*4),(abs(mouseY-300))/10);
  stroke(255,255,153);
  strokeWeight(((abs(mouseX-300))+(abs(mouseY-300)))/40);
  ellipseMode(CENTER);
  ellipse(300,300,abs(mouseX-300),abs(mouseY-300));
}
