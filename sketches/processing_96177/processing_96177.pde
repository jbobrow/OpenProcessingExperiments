


void setup()
{
  size(600,600);
  background(0);
  rectMode(CENTER);
  colorMode(HSB, height, height, height); 
  noCursor();

  
}
void draw()
{
background(0);

  strokeWeight(2.5);
  stroke(#FFFFFF);
  line(mouseX,mouseY,mouseY,600);
  fill(mouseX,width/2,mouseY);
  ellipse(mouseX,mouseY,20+mouseX/4,20+mouseY/4);

}






