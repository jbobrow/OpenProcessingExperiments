
Vine v;
int seed;

 void setup()
{
  size(900, 450);
  colorMode(HSB, 1);
  background(1);
  smooth();

  seed = int(random(200, 600));
  v = new Vines(seed);
}

 void draw()
{
  v.run();
}

 void mousePressed()
{
  reset();
}

 void reset()
{
  setup();
  draw();
}

 class Vine
{
  PApplet p;
  float   oldx;
  float   oldy;
  float   angle;
  float   weight;

  Vine()
  {
    oldx = random(width);

    float prob = random(100);
    if (prob < 50)
    {
      oldy = 0;
    } 
    else
    {
      oldy = height;
    }

    angle = random(TWO_PI);
    weight = random(6);
  }

  void run()
  {
    render();
  }

  void render()
  {
    float newx = oldx + cos(angle) * 5;
    float newy = oldy + sin(angle) * 5;

    //stroke(1);
    stroke(0, 1, noise(weight, angle));

    if (weight <= 0)
      weight = 0;
    else
      strokeWeight(weight);

    line(newx, newy, oldx, oldy);

    oldx = newx;
    oldy = newy;

    angle += random(-0.1f, 0.1f);
    weight -= 0.05f;
  }

  boolean dead()
  {
    if (weight <= 0)
      return true;
    else
      return false;
  }
}

 class Vines
{
  ArrayList<Vine> vns;

  Vines(int num)
  {
    vns = new ArrayList<Vine>();

    for (int i=0; i<num; i++)
    {
      vns.add(new Vine());
    }
  }

  void run()
  {
    for (int i=0; i<vns.size(); i++)
    {
      Vine v = (Vine) vns.get(i);
      v.run();

      if (v.dead())
        vns.remove(i);
    }
  }
}
                                
