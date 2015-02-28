
void draw()
{
  if(mouseX <= 40)
  drawGlass();
  else if(mouseX >= 60)
  drawGlass();
  else if(mouseY <= 40)
  drawGlass();
  else if(mouseY >= 60)
  drawGlass();
  else
  background(100);
}

void drawGlass()
{ 
noStroke();
fill(0);
rect(30,80,40,10);
rect(45,40,10,40);
fill(255);
triangle(20,25,80,25,50,50);
stroke(0);
fill(255,240,0);
triangle(30,30,70,30,50,45);
fill(0,200,0);
ellipse(70,10,7,7);
line(70,10,50,40);
}
