
float iw = random(80, 100);
float ih = random(40, iw-10);
float ir = random(50, 200);
float ig = random(50, 150);
float ib = random(50, 150);
float ilefty = random(3, ih/4);
float iupy = random(5, ih/6);
float mul = 0.01;
float cnt = 0;

void setup()
{
  size(1024, 768);
  background(150, 190, 220);
  smooth();
  noStroke();
}
 
void draw()
{
  //cnt += 0.01;
  //ir = noise(cnt+50)*500;
  //ig = noise(cnt+80)*500;
  //ib = noise(cnt)*500;
  
  background(150, 190, 220);
   
  for (int i = 0; i < 9; i++)
  {
    for (int j = 0; j < 19; j++)
    {
      pushMatrix();
      translate(65+i*130-80*(j%2), 40+j*70);
       
      float w = constrain(random(iw-mouseX*mul*2, iw+mouseX*mul*2), 40, 120);
      float h = constrain(random(ih-mouseX*mul*2, ih+mouseX*mul*2), 30, w-10);
      float r = 70+random(ir-mouseX*3.5*mul, ir+mouseX*3.5*mul);
      float g = r+random(ig-mouseX*3.5*mul, ig+mouseX*3.5*mul)-70;
      float b = r+random(ib-mouseX*3.5*mul, ib+mouseX*3.5*mul)-70;
   
      //tail
      fill(r+random(-mouseX*mul, mouseX*mul), g+random(-mouseX*mul, mouseX*mul), b+random(-mouseX*mul, mouseX*mul));
      float lefty = random(ilefty-mouseX*mul*mul, ilefty+mouseX*mul*mul);
      float upy = random(iupy-mouseX*mul*mul, iupy+mouseX*mul*mul);
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
