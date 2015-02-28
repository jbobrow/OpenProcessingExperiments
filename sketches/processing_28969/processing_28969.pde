

//Made with help from a CirclePacking example found online.
//All mentioned methods can be found at http://www.cricketschirping.com/processing/CirclePacking1/
int nutrients = 7000;
ArrayList<Bacteria> bacColony;
final int radiusSize = 3;
int MAX_BACTERIA = 400;

void setup()
{
  size (400, 400);
  smooth();
  background(255);
  frameRate(1);
  bacColony = initialPopulation(10);
}

void draw()
{
  background(255);
  for (int i = 0; i < bacColony.size(); i++)
  {
    getBacteria(i).draw();
    getBacteria(i).advanceDay();
    getBacteria(i).older(i);
  }
  for (int i = 1; i < bacColony.size(); i++)
  {
    iterateLayout(i);
  }
  fill(0);
  text("Nutrients left:" + nutrients, width - 120, height - 10);
  text("Bacteria Population:" + bacColony.size(), 10, height - 10);
}

void keyPressed()
{
  if (key == 'f' || key == 'F')
    nutrients += 2500;
  if (key == 'r' || key == 'R')
  {
    setup();
    nutrients = 7000;
  }
  if (key == 's' || key == 'S')
    nutrients -= 2500;
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    Bacteria b = new Bacteria(0, color(random(255), random(255), random(255)), false, mouseX, mouseY);
    bacColony.add(b);
  }
  else if (mouseButton == RIGHT)
  {
    Bacteria b = new Bacteria(0, color(random(255), random(255), random(255)), true, mouseX, mouseY);
    bacColony.add(b);
  }
}

Bacteria getBacteria(int i)
{
  return (Bacteria)bacColony.get(i);
}

ArrayList initialPopulation(int p)
{
  ArrayList pioneer = new ArrayList();
  int l = (int) random(2);
  boolean check;
  if (l == 0)
  {
    check = true;
  }
  else
  {
    check = false;
  }

  while (p > 0)
  {
    Bacteria b = new Bacteria((int) random(20), color(random(255), random(255), random(255)), check, random(width - 120), random(height - 10));
    p--;
    pioneer.add(b);
  }
  return pioneer;
}

Comparator comp = new Comparator()
{
  public int compare(Object p1, Object p2)
  {
    Bacteria a = (Bacteria)p1;
    Bacteria b = (Bacteria)p2;
    if (a.distanceToCenter() < b.distanceToCenter())
      return 5;
    else if (a.distanceToCenter() > b.distanceToCenter())
      return -5;
    else
      return 0;
  }
};

//Method derived from aforementioned Circlepacking example.
void iterateLayout(int iterationCounter)
{

  Object bac[] = bacColony.toArray();
  Arrays.sort(bac, comp);

  //fix overlaps
  Bacteria ci, cj;
  PVector v = new PVector();

  for (int i=0; i<bac.length; i++)
  {
    ci = (Bacteria)bac[i];
    for (int j=i+1; j<bac.length; j++)
    {
      if (i != j)
      {
        cj = (Bacteria)bac[j];
        float dx = cj.x - ci.x;
        float dy = cj.y - ci.y;
        float r = ci.radius + cj.radius;
        float d = (dx*dx) + (dy*dy);
        if (d < (r * r) - 0.01 )
        {

          v.x = dx;
          v.y = dy;

          v.normalize();
          v.mult((r-sqrt(d))*0.5);


          cj.x += v.x;
          cj.y += v.y;



          ci.x -= v.x;
          ci.y -= v.y;
        }
      }
    }
  }

  //Contract
  float damping = 0.1/(float)(iterationCounter);
  for (int i=0; i< bac.length; i++) {
    Bacteria c = (Bacteria)bac[i];
    v.x = c.x-width/2;
    v.y = c.y-height/2;
    v.mult(damping);
    c.x -= v.x;
    c.y -= v.y;
  }
}


class Bacteria
{
  private int age;
  private float x, y;
  private float radius;
  private boolean disease;
  color col;

  public Bacteria(int a, color colr, boolean diseased, float q, float z)
  {
    age = a;
    disease = diseased;
    col = colr;
    x = q;
    y = z;
    radius = radiusSize;
  }

  void draw()
  {
    fill(col);
    stroke(col);
    strokeWeight(3);
    ellipse((int)getX(), (int)getY(), (int)radius * 2, (int)radius * 2);
  }   

//Checks if the specified bacteria is at least 10.
  public boolean isMature()
  {
    if (age >= 10)
      return true;
    return false;
  }

//Checks if the bacteria is diseased.
  public boolean isDiseased()
  {
    if (disease == true)
      return true;
    return false;
  }

  public int getAge()
  {
    return age;
  }

  public color getColor()
  {
    return col;
  }

  public float getX()
  {
    return x;
  }

  public float getY()
  {
    return y;
  }
//Adds one cycle day to the bacteria's time alive, and makes the bacteria brighter.
  void age()
  {
    age = getAge() + 1;
    col += color(5,5,5);
  }
//Kills the bacteria(removes it from the array).
  void die(int i)
  {
    bacColony.remove(i);
  }

//Determines if there's enough space for the bacteria, and then attempts to cause it to reproduce if it's mature.
  void reproduce()
  {
    if (bacColony.size() < MAX_BACTERIA)
    {
      if (isMature())
      {
        Bacteria b = new Bacteria(0, getColor(), isDiseased(), getX() - 6, getY() - 6);
        bacColony.add(b);
      }
    }
  }

//Ages or kills a bacteria.
  void older(int i)
  {
    if (getAge() < 20)
    {
      if (isDiseased())
        age();
      age();
    }
    else
    {
      die(i);
    }
  } 
  
//Method derived from aforementioned Circlepacking example.
  public float distanceToCenter() {
    float dx = x - WIDTH/2;
    float dy = y - HEIGHT/2;
    return (sqrt(dx*dx + dy*dy));
  }
  
//Method derived from aforementioned Circlepacking example.
  public boolean intersects(Bacteria c) {
    float dx = c.x - x;
    float dy = c.y - y;
    float d = sqrt(dx*dx + dy*dy);
    return d < radius || d < c.radius;
  }

//Consume some nutrients.
  void eat()
  {
    if (nutrients > 0)
    {
      MAX_BACTERIA = 375;
      if (isMature())
      {
        nutrients--;
      }
      nutrients--;
    }
    else if (nutrients == 0)
    {
      age();
      MAX_BACTERIA = 0;
    }
    else
    {
      nutrients = 0;
    }
  }

  //Processes bacteria and attempts to get them to reproduce and consume nutrients.
  void advanceDay()
  {
    eat();
    reproduce();
  }
}


