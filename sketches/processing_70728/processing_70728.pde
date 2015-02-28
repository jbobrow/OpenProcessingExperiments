
float iw = random(80, 100);
float ih = random(40, iw-10);
float ir = random(50, 180);
float ig;
float ib;
float ilefty = random(5, ih/4);
float iupy = random(5, ih/6);
float mul = 0.01;
int cnt = 0;

void setup()
{
  size(1024, 768);
  background(170, 210, 230);
  smooth();
  noStroke();

  int rang = round(random(1));
  if (rang == 0) ig = ir-random(30, 90);
  else ig = ir+random(30, 90);
  int ranb = round(random(1));
  if (ranb == 0) ib = ir-random(30, 90);
  else ib = ir+random(10, 50);
  
  for (int i = 0; i < 7; i++)
  {
    for (int j = 0; j < 11; j++)
    {
      pushMatrix();
      translate((i*170-80*(j%2)+0.03*cnt+30)%(width+150)-80, 35+j*70);
      
      float r = 70+random(ir-mouseX*3.5*mul, ir+mouseX*3.5*mul);
      float g = r+random(ig-mouseX*3.5*mul, ig+mouseX*3.5*mul)-70;
      float b = r+random(ib-mouseX*3.5*mul, ib+mouseX*3.5*mul)-90;
      fill(r, g, b);

      //tail
      triangle(-(iw/2)+5, 0, -(iw/2)-ilefty, -iupy, -(iw/2)-ilefty, iupy);

      //body
      bezier(-(iw/2), 0, -(iw/3), -(ih/2), (iw/3), -(ih/2), (iw/2), 0);
      bezier(-(iw/2), 0, -(iw/3), (ih/2), (iw/3), (ih/2), (iw/2), 0);

      //eye
      fill(0);
      ellipse((iw/2)/2, (-ih/3.5)/2, 5, 5);

      popMatrix();
    }
  }
}
 
void draw()
{
  if (mouseX != pmouseX || mouseY != pmouseY)
  {
    background(170, 210, 230);

    for (int i = 0; i < 7; i++)
    {
      for (int j = 0; j < 11; j++)
      {
        pushMatrix();
        cnt++;
        translate((i*170-80*(j%2)+0.03*cnt+30)%(width+150)-80, 35+j*70);

        float w = constrain(random(iw-mouseX*mul*2.5, iw+mouseX*mul*2.5), 40, 100);
        float h = constrain(random(ih-mouseX*mul*2.5, ih+mouseX*mul*2.5), 30, w-10);
        float r = 70+random(ir-mouseX*3.5*mul, ir+mouseX*3.5*mul);
        float g = r+random(ig-mouseX*3.5*mul, ig+mouseX*3.5*mul)-70;
        float b = r+random(ib-mouseX*3.5*mul, ib+mouseX*3.5*mul)-90;

        //tail
        fill(r+random(-mouseX*3*mul, mouseX*3*mul), g+random(-mouseX*3*mul, mouseX*3*mul), b+random(-mouseX*3*mul, mouseX*3*mul));
        float lefty = constrain(random(ilefty-mouseX*mul, ilefty+mouseX*mul), 4, h/4);
        float upy = constrain(random(iupy-mouseX*mul, iupy+mouseX*mul), 4, h/6);
        triangle(-(w/2)+5, 0, -(w/2)-lefty, -upy, -(w/2)-lefty, upy);

        //body
        fill(r, g, b);
        bezier(-(w/2), 0, -(w/3), -(h/2), (w/3), -(h/2), (w/2), 0);
        bezier(-(w/2), 0, -(w/3), (h/2), (w/3), (h/2), (w/2), 0);

        //eye
        fill(0);
        ellipse((w/2)/2, (-h/3.5)/2, 5, 5);

        popMatrix();
      }
    }
  }
}
