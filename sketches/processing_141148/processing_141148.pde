
void setup()
{
  size( 1300, 700 );
  background(0,100);
  smooth();
  frameRate(20);
}
 
void draw()
{
  noCursor();
  
  noStroke();
  fill(0,0,0);
  rect(0,0,1330,700);
  fill(255,255,153);
  ellipse(pmouseX,pmouseY,300,300);
  fill(0);
  ellipse(mouseX,mouseY,305,305);

}
