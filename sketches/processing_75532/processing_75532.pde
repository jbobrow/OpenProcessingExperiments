
class firework
{
  int count  = 100;
  spark piece[] = new spark[count];
  boolean exploded = false;
  int age = 0;
  PVector pos, vel;
  int ftime=50;
  float g = 0.05;  
  float shade;
  firework()
  {
    pos = new PVector(width/2, height);
    float angle = random(PI/3, PI*2/3);
    vel = new PVector(cos(angle), -sin(angle));
    vel.mult(random(5,7));
    shade = random(0,100);
    ftime = (int)random(40,60);
  }

  void draw()
  {
    if (exploded)
      debris();
    else 
      flight();
  }

  void flight()
  {
    stroke(100);
    line(pos.x, pos.y, pos.x+vel.x, pos.y+vel.y);

    pos.add(vel);
    vel.y += g;

    if (age++ > ftime) explode();
  }

  void explode()
  {
    exploded = true;
    for (int s=0;s<count;s++) piece[s] = new spark(pos, shade);
  }

  void debris()
  {
    for (spark s: piece)
    {
      s.draw();
      s.move();
    }
  }
}


