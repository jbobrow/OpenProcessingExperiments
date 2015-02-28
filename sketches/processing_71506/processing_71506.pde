
//Shela H. CP 1 mods 16-17 User Input

void setup()
{
  size(500,500);
  background(22,24,59);
  smooth();
}
void draw()
{
}
void mouseDragged()
{
   noStroke();
  fill(random(255),random(255),random(255),10);
  rect(mouseX,mouseY,50,50); 
  rect(500-mouseX,500-mouseY,50,50); 
}
void keyPressed()
{
   ellipse(mouseX,mouseY,50,50); 
  ellipse(500-mouseX,500-mouseY,50,50); 
  if(key == 'g')
  {
   fill(81,206,170,20);
   stroke(151,245,217,5);
  }
  if(key == 'o')
  {
   fill(229,140,5,20);
   stroke(250,208,144,5);
  }
   if(key == 'b')
  {
   fill(102,145,234,30);
   stroke(184,206,252,5);
  }
   if(key == 'r')
  {
   fill(222,90,90,30);
   stroke(247,132,132,5);
  }
  if(key == 'c')
  {
    fill(random(255),random(255),random(255),20);
    stroke(random(255),random(255),random(255),20); 
  }
  if (key == 'e')
  {
    erase();
  }
}
void erase()
{
   background(22,24,59);
}
