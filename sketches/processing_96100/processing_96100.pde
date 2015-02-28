
PVector orgin = new PVector(100f, 100f);

List<firework> rockets = new ArrayList<firework>(); ;
void setup()
{
  size(800,400);
  colorMode(HSB, 100);
}

void draw()
{
  fill(0, 80);
  rect(0, 0, width, height);
  if ( random(100)>90 ) rockets.add(new firework() );
  for(firework f: rockets) f.draw();
}

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

class spark 
{
  PVector pos = new PVector(), vel = new PVector() ;
  float age;

  float maxvel = 1.0;
  float g = 0.05;

  color start = color(0, 75, 100);
  color fade = color(0, 100, 0);
  float life = 100;

  public spark(PVector i, float shade)
  {
    pos.set(i);
    float th = random(0, TWO_PI);
    float maxvel = 10*cos(random(0, PI/2.0));
    vel.x = maxvel*cos(th);
    vel.y = maxvel*sin(th);
    age = 0;
    start = color(shade,100,100);
  }

  void move()
  {
    pos.add(vel);
    vel.y += g;
    if (vel.mag()>2)    vel.mult(1.0/sqrt(vel.mag()));
    age++;
  }

  void draw()
  {
    float a = age/life;
    if (a<=1) 
    {
      noStroke();
      color c = lerpColor(start, fade, a);
      fill(c, 50);
      ellipse (pos.x, pos.y, 3, 3);
      fill(c);
      point(pos.x, pos.y);
    }
  }
}



