
void setup()
{
size(500, 500);
background(255);
}

void draw()
{
  fill(#e7761b);
  if(mouseY>0) { 
  if(mouseY<500) {
      background (255);
      noStroke();
      
translate(250, 250);      
ellipse(mouseX,mouseY,150,150);
fill(0);
rotate(radians(-30));
ellipse(mouseX+75,mouseY-34,60,60);
rotate(radians(-60));
ellipse(mouseX-28,mouseY+19,60,60);
rotate(radians(30));
ellipse(mouseX+53,mouseY-54,60,60);
rotate(radians(43));
ellipse(mouseX-16,mouseY+57,60,60);
rotate(radians(90));
ellipse(mouseX+86,mouseY-43,60,60);
  }
  }
}
