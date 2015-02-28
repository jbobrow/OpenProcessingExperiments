
void setup()
{
  size(400,400);
  background(0);

}

void draw()
 
{
  
  

  if (mousePressed == true)
  { 
    draw_flargle_blargle();
  }
}

void draw_flargle_blargle()
{  fill(random(255));
  triangle(mouseX,mouseY,mouseX+20,mouseY+10,mouseX+20,mouseY-10);

}

