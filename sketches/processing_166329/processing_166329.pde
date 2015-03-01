
void draw()
{
  size(500,500);
  
  background(255,204,0);

  fill(mouseX,mouseX*0.5,mouseY);
  ellipse(mouseX,mouseY,mouseX*0.6,mouseY*0.42);
  fill(mouseY,mouseX*0.2,mouseX);
  rect(mouseX-10,9+mouseX,mouseY*0.5,mouseX*0.7);
  line(0,0,mouseX,mouseY);
  line(500,500,mouseX,mouseY);
line(500,0,mouseX,mouseY);
line(0,500,mouseX,mouseY);
 
}


