
//rainbow boxes-sandychen
//9/16/10 
void setup()
{
     background(255);
  size(500,500);

  smooth();
}
void draw()
{
  fill(random(255),random(255),random(255));
  rect(mouseX,mouseY,70,70);
  stroke(255);

  if(mousePressed)
{
  background(mouseX,mouseY,100);
}
}

