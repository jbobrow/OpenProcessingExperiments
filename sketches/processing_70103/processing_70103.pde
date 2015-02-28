
void setup()
{
  size(1000, 1000);
  background(120, 160, 200);
  smooth();
  noStroke();
  frameRate(1);
}

void draw()
{
  background(120, 160, 200);
  
  for (int i = 0; i < 5; i++)
  {
    for (int j = 0; j < 7; j++)
    {
      int x = 100+i*200;
      int y = 50+j*150;
      float w = random(40, 150);
      float h = random(20, w-10);
      float r = random(30, 255);
      float g = r+random(-30, 40);
      float b = r+random(-30, 40);
  
      //tail
      fill(r+random(-20, 20), g+random(-20, 20), b+random(-20, 20));
      float lefty = random(3, h/4);
      float upy = random(5, h/6);
      triangle(x-(w/2)+random(3, 10), y, x-(w/2)-lefty, y-upy, x-(w/2)-lefty, y+upy);
  
      //body
      fill(r, g, b);
      bezier(x-(w/2), y, x-(w/3), y-(h/2), x+(w/3), y-(h/2), x+(w/2), y);
      bezier(x-(w/2), y, x-(w/3), y+(h/2), x+(w/3), y+(h/2), x+(w/2), y);
  
      //eye
      fill(0);
      ellipse((x+x+(w/2))/2, (y-(h/3.5)+y)/2, 5, 5);
    }
  }
}
