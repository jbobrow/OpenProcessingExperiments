
class Thing
{
  float x;
  float y;
  float xv = -random(5);
  float yv = -random(5);
  float maxYV = 20;
  float gravity = 0.5;
  float radius = 10;
  color c;
   
  Thing(){  }
 
  Thing(float xp,float yp)
  {
    x = xp;
    y = yp;
  }
 
  void run()
  {
    update();
    drawThing();
  }
 
  public void update()
  {
    if(x <= radius)
    {
      xv = -xv;
    }
    else if(x >= width - radius)
    {
      xv = -xv;
    }
 
    if(y >= height - radius)
    {
      yv = -yv;
      if(y + radius - height >= 0.15)
      {
        y = height - radius;
        if(yv > -0.1)
        {
          xv *= 0.96;
        }
      }
    }
 
    if((yv < maxYV))
    {
      yv += gravity;
    }
    //println(yv);
    y += yv;
 
    x += xv;
  }
 
  void drawThing()
  {
    int g = int(random(75, 215));
    fill(color(240, g, g+20));
    ellipse(x,y,radius,radius);
  }
}

class System
{
  ArrayList particles = new ArrayList();
   
  System(){}
   
  void add(Thing p)
  {
    particles.add(p);
  }
   
   
  void run()
  {
    for(int i = 0; i < particles.size(); i++)
    {
      Thing p = (Thing)particles.get(i);
      p.run();
    }
  }
}

System ps = new System();
boolean mouseDown = false;
 
void setup()
{
  size(500,450);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}
 
void draw()
{
  color c1 = color(#CCCCFF);
  color c2 = color(#EEEEFF);
  gradientBackground(c1, c2);
  if(mousePressed)
  {
    ps.add(new Thing(mouseX, mouseY));
  }
  ps.run();
}


void gradientBackground(color c1, color c2) {
  for (int i=0; i<=width; i++){
    for (int j = 0; j<=height; j++){
      color c = color(
      (red(c1)+(j)*((red(c2)-red(c1))/height)),
      (green(c1)+(j)*((green(c2)-green(c1))/height)),
      (blue(c1)+(j)*((blue(c2)-blue(c1))/height))
        );
      set(i, j, c);
    }  
  }
}               
