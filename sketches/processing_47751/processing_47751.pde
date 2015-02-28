
class Wave
{
  float x, y, z;
  float n;
  color c;
  
  Wave()
  {
    x = 0;
    y = 0;
    z = 0;
    n = random(255);
    c = color(random(64)+128, random(64)+64, random(64)+64);
  }
  
  void run()
  {
    update();
    render();
  }
  
  void update()
  {
    y = noise(n)*128;
    n+=0.01;
    x += 1;
    
    if (x > 256)
    {
      x = 0;
      z += 16;
      c = color(random(64)+128, random(64)+64, random(64)+64);
      if (z > 255)
      {
        z = 0;
        background(255);
      }
    }
  }
  
  void render()
  {
    stroke(c, 64);
    line(x, 0, z, x, y, z);
  }
}

