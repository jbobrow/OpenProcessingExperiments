

void setup()
{
  size(1010,1000);
  background(255,255,255);
  float x = random(500);
  noCursor();
  while (x > 0)
  {
    fill(random(180),random(180),random(180));
    ellipse(random(1000),random(1000),50,50);
    x = x - 1;
  }
}

void draw()
{
  strokeWeight(4);
  stroke(255,255,255);
  line(pmouseX,pmouseY,mouseX,mouseY);
}
 
void mouseDragged()
{
   if (mouseButton == LEFT)
     {
       float x = random(500);
       while (x > 0)
      {
        stroke(0,0,0);
        fill(random(180),random(180),random(180));
        ellipse(random(1000),random(1000),50,50);
        x = x - 1;
      }
     }
}

void keyPressed()
{
  if (key == TAB)
  {
    stroke(0,0,0);
    fill(random(180),random(180),random(180));
    triangle(random(1000),random(1000),random(1000),random(1000),random(1000),random(500));
  }
}


