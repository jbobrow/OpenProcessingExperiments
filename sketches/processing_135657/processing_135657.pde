
void setup()
{
size(400,400);
background(28,28,28);
smooth();
}
void draw()
{
  float r=random(400); 
  noStroke();
  stroke(200,80,mouseX);
  noFill();
ellipse(mouseX,mouseY,20,20);
if(mouseButton==RIGHT) {
  fill(28,28,28);
  rect(0,0,400,400);

}
}
