
float iw = random(80, 120);
float ih = random(40, iw-10);
float ir = random(30, 255);
float ig = ir+random(-30, 40);
float ib = ir+random(-30, 40);
float ilefty = random(3, ih/4);
float iupy = random(5, ih/6);
float mul = 0.1;

void setup()
{
  size(1300, 1000);
  background(120, 160, 200);
  smooth();
  noStroke();
  noLoop();
}

void draw()
{
  background(120, 160, 200);
  
  for (int i = 0; i < 10; i++)
  {
    for (int j = 0; j < 11; j++)
    {
      //pushMatrix();
      //translate(100+i*160, 50+j*110);
      int x = 70+i*130;
      int y = 50+j*90;
      
      float w = random(iw-55*i*mul, iw+55*i*mul);
      float h = random(ih-30*i*mul, ih+30*i*mul);
      float r = random(ir-30*i*2*mul, ir+40*i*2*mul);
      float g = r+random(ig-30*i*2*mul, ig+40*i*2*mul);
      float b = r+random(ib-30*i*2*mul, ib+40*i*2*mul);
  
      //tail
      fill(r+random(-20, 20), g+random(-20, 20), b+random(-20, 20));
      float lefty = random(ilefty-5*i*mul, ilefty+5*i*mul);
      float upy = random(iupy-8*i*mul, iupy+8*i*mul);
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
