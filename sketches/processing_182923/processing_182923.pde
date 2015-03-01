
PVector rootn = new PVector(random(123), random(123));//noise root
PVector speedn = new PVector(random(-.01, .01), random(-.01, .01));//noise speed
ArrayList<Part> parts = new ArrayList<Part>(), toAdd = new ArrayList<Part>();//Parts
PVector m, pm;//mouse, previous mouse
float maxD = 10;//max distance between two smokes
PGraphics pg;
int b = 10;
PImage img;

void setup()
{
  size(600, 450, P2D);
  pg = createGraphics(width, height, P2D);
}

void draw()
{
  pg.beginDraw();
  pg.noStroke();
  pg.fill(5, 15);
  pg.rect(0, 0, width, height);

  for (Part p : toAdd)
  {
    parts.add(p);
  }
  toAdd = new ArrayList<Part>();

  rootn.add(speedn);
  m = new PVector(mouseX, mouseY);
  int nb = parts.size()-1;
  if (mousePressed && nb < 800)
  {
    if (pm == null) pm = m.get();
    else
    {
      float d = PVector.dist(pm, m);
      if ((pm.x != m.x || pm.y != m.y) && d > maxD)
      {
        int n = int(d / maxD);
        PVector tmp = PVector.sub(m, pm);
        tmp.normalize();
        tmp.mult(maxD);
        PVector tmp2 = m.get();
        for (int i = 0; i < n; i++)
        {
          tmp2.sub(tmp);
          parts.add(new Part(tmp2, (int)random(0, 25), (int)random(50, 140), 0));
        }
      }
    }
    parts.add(new Part(m, (int)random(0, 25), (int)random(50, 140), 0));
    pm = m.get();
  }
  nb = parts.size()-1;
  for (int i = nb; i > -1; i--)
  {
    if (parts.get(i).display())
      parts.remove(i);
  }

  pg.endDraw();
  image(pg, 0, 0);
  /*
  img = get();
  img.resize(width/2, height/2);
  img.resize(width-b, height-b);
  image(img, b/2, b/2);
  */
}

void mouseReleased()
{
  pm = null;
}

class Part
{
  float rad, c = random(.6, .8), theta = random(TWO_PI), nx, ny;
  int life, age, mod = (int)random(30, 40);
  PVector pos;

  Part(PVector p, int a, int l, float r)
  {
    pos = p.get();
    age = a;
    life = l;
    rad = r;
  }

  Boolean display()
  {
    nx = noise(rootn.x + pos.x/500)-.5;
    ny = noise(rootn.y + pos.y/500)-.5;
    pos.add(new PVector(6*nx, 6*ny));
    rad += cos(map(age, 0, life, 0, HALF_PI)) * c;
    pg.stroke(200, 200 * sq(map(age, 0, life, 1, 0)));
    pg.strokeWeight(rad);
    pg.point(pos.x, pos.y);
    if (age++ % mod == 0)//split the Part in two
    {
      toAdd.add(new Part(new PVector(pos.x + rad/3 * cos(theta), pos.y + rad/3 * sin(theta)), age, life, rad * random(.6, .8)));
      toAdd.add(new Part(new PVector(pos.x - rad/3 * cos(theta), pos.y - rad/3 * sin(theta)), age, life, rad * random(.6, .8)));//.6
      age = life+1;
    }
    return age > life;
  }
}



