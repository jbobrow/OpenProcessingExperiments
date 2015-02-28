
void setup()
{
  size(600,500);
  background(220,0,0);
  
}

void draw() 
{
  textSize(55);
  text("Merry Christmas", 100,100);
 
  ellipse(mouseX, mouseY, 20,20);
  fill(0,200,0);
  if(mousePressed)
  {
   fill(200,0,0);
  }
}
