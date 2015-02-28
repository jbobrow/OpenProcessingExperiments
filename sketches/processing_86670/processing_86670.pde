
ArrayList parts = new ArrayList();
ArrayList receps = new ArrayList();
PVector lm = new PVector(0, 0);
int pRad = 2; //raw density of the particles in the liquid
float bounce = 0.05; //bouncyness off of walls
float viscosity = 5; //high = more goupy, literally radius of effect of the receptors on the particlesfloat velDecay = 1;   //between 2 and 3, 3 is really inactive, literally the denominator by which we divide the particles effect on the receptor; decrease in activity is exponential
float friction = 1; //friction of the parts themselves; do not touch!
float mousePower = 10;
float gravity = 0.2;
float smoothing = 20; //high = less smoothing, literally the amount that the average is skewed towards particle A 
static float bWidth = 300, bHeight = 300, bx = 0, by = 0;
float pFrequency = 6;
float speedLimit = 10;
float tension = 200;
float bonding = 5;
void setup(){
  size(300, 300);
  
  for (int i = 0; i < bWidth/2 / pFrequency; i ++)
  {
    for (int j = 0; j < bHeight/2 / pFrequency; j ++)
    {
      parts.add(new Part(i * pFrequency + bx, j * pFrequency + by + bHeight/2, random(1), random(1)));
    }
  }
  println(parts.size());
  for (int i = 0; i < (bWidth - 2) / 10; i ++)
  {
    for (int j = 0; j < (bHeight - 2) / 10; j ++)
    {
      receps.add(new Receptor(i * 10 + bx, j * 10 + by, 0, 0));
    }
  }
}

void draw(){
  
  noStroke();
  
  fill(255);
  rectMode(CORNER);
  rect(bx, by, bWidth, bHeight);
  float hy = height;
  for (int j = 0; j < parts.size() - 1; j ++)
  {
    Part p1 = (Part) parts.get(j);
    updatePart(p1);
    interact(p1);
    for (int l = 0; l < receps.size(); l ++)
    {
      Receptor r = (Receptor) receps.get(l);
      float dx2 = p1.x - r.x;
      float dy2 = p1.y - r.y;
      float d2 = sqrt(dx2 * dx2 + dy2 * dy2);
      if (d2 < viscosity)
      {
        //r.dens = abs(((d2/(viscosity - 2)) + r.dens) / 2);
        r.vx = (p1.vx + r.vx) / 2;
        r.vy = (p1.vy + r.vy) / 2;
        p1.vx = (p1.vx + p1.vx + r.vx) / 3;
        p1.vy = (p1.vy + p1.vy + r.vy) / 3;
        //r.dens *= 0.98;
      }
    }
    for (int k = j + 1; k < parts.size(); k ++)
    {
      Part p2 = (Part) parts.get(k);
      float dx = p1.x - p2.x;
      float dy = p1.y - p2.y;
      float dist = sqrt(dx * dx + dy * dy);
      repel(dx, dy, dist, p1, p2);
      if (dist < pRad * 2)
      {
        float avx = (p1.vx + p2.vx) / 2;
        float avy = (p1.vy + p2.vy) / 2;
        if (abs(avx) > 0.1) if (abs(avy) > 0.1)
        {
          p1.vx = (p1.vx * smoothing + p2.vx) / (smoothing + 1);
          p1.vy = (p1.vy * smoothing + p2.vy) / (smoothing + 1);
          p2.vx = (p2.vx * smoothing + p1.vx) / (smoothing + 1);
          p2.vy = (p2.vy * smoothing + p1.vy) / (smoothing + 1);
        }
      }
    }
    p1.update();
  }
  for (int j = 0; j < receps.size() - 1; j ++)
  {
    Receptor r1 = (Receptor) receps.get(j);
    if (abs(r1.vx) > 0.7) if (abs(r1.vy) > 0.7) r1.update();
    r1.dens *= 0.98;
    /*for (int k = j + 1; k < receps.size(); k ++)
    {
      Receptor r2 = (Receptor) receps.get(j);
      float dx = (r1.x + r1.vx * 5) - r2.x;
      float dy = (r1.y + r1.vy * 5) - r2.y;
      float dist = sqrt(dx * dx + dy * dy);
      if (dist < 10)
      {
        if (r2.dens > 0) 
        {
          r2.dens = (r1.vx * 3 + r2.dens) / 4;
        }
      }
    }*/
  }
    
  textSize(18);
  fill(0, 60, 255);
  text("Stylus", 10, 20);
  //if (mousePressed) parts.add(new Part(mouseX, mouseY, 0, 0));
  lm.x = mouseX;
  lm.y = mouseY;
}
///////////////////////////////////////////////////////////////////////////////////////////Other Things
void updatePart(Part p)
{
  if (p.vx > speedLimit)
  {
    p.vx = speedLimit;
  }
  if (p.vx < -speedLimit)
  {
    p.vx = -speedLimit;
  }
  if (p.vy > speedLimit)
  {
    p.vy = speedLimit;
  }
  if (p.vy < -speedLimit)
  {
    p.vy = -speedLimit;
  }
  p.vx *= friction;
  p.vy *= friction;
  p.vy += gravity;
}
void interact(Part p)
{
  float dx = p.x - mouseX;
  float dy = p.y - mouseY;
  float dist = sqrt(dx * dx + dy * dy);
  if (dist < bWidth/10) if (mousePressed)
  {
    if (mousePressed && (mouseButton == LEFT)) 
    {
       p.vx = (((lm.x - mouseX) * -mousePower / 10) + p.vx) / 2;
       p.vy = (((lm.y - mouseY) * -mousePower / 10) + p.vy) / 2;
       p.vx = (((lm.x - mouseX) * -mousePower / 10) + p.vx) / 2;
       p.vy = (((lm.y - mouseY) * -mousePower / 10) + p.vy) / 2;
    } 
    else if (mousePressed && (mouseButton == RIGHT)) 
    {
      p.vx += cos(atan2(dy, dx) + 1.57079633) * 2;
      p.vy += sin(atan2(dy, dx) + 1.57079633) * 2;
    }
  }
}
void repel(float dx, float dy, float dist, Part p1, Part p2)
{
  float tx;
  float ty;
  float ax;
  float ay;
  
  if (dist < pRad * 2)
  {
    tx = p1.x + dx / dist * pRad * 2;
    ty = p1.y + dy / dist * pRad * 2;
    ax = (tx - p1.x) * bounce;
    ay = (ty - p1.y) * bounce;
    p1.vx += ax;
    p1.vy += ay;
    p2.vx -= ax;
    p2.vy -= ay;
  }
}
class Part
{
  float x = 1, y = 1, vx = 0, vy = 0, bWidth = 0, bHeight = 0, bx = 0, by = 0;
  Part(float nx, float ny, float nvx, float nvy)
  {
    strokeWeight(0);
    fill(255, 0, 0);
    x = nx;
    y = ny;
    vx = nvx;
    vy = nvy;
    bWidth = Parts.bWidth;
    bHeight = Parts.bHeight;
    bx = Parts.bx;
    by = Parts.by;
  }
  void update()
  {
    x += vx;
    y += vy;
    fill(0, 0, 255);
    dRect();
    float dx = 0;
    float dy;
    float tx;
    float ty;
    float ax;
    float ay;
    if (y > bHeight + by - 10)
    {
      dy = y - bHeight + by - 10;
      ty = y + dy / dy * 10;
      ay = (ty - y) * 0.05;
      vy -= ay;
    }
    if (y < by + 10)
    {
      dy = y - by;
      ty = y + dy / dy * 10;
      ay = (ty - y) * 0.1;
      vy += ay;
    }
    if (x > bWidth + bx - 10)
    {
      dx = x - bWidth + bx - 10;
      tx = x + dx / dx * 10;
      ax = (tx - x) * 0.05;
      vx -= ax;
    }
    if (x < bx + 10)
    {
      dx = x - bx;
      tx = x + dx / dx * 10;
      ax = (tx - x) * 0.2;
      vx += ax;
    }
    if (y > bHeight + by)
    {
      y = bHeight + by - 2;
    }
    if (y < by)
    {
      y = by + 2;
    }
    if (x > bWidth + bx)
    {
      x = bWidth + bx - 2;
    }
    if (x < bx)
    {
      x = bx + 2;
    }
  }
  void dEllipse()
  {
    ellipseMode(CENTER);
    ellipse(x, y, 3, 3);
  }
  void dRect()
  {
    rectMode(CENTER);
    rect(x, y, 10, 5);
  }
}
class Receptor
{
  float x = 1, y = 1, vx = 0, vy = 0;
  float friction = 0.98;
  float dens = 1;
  int cp = 0;

  Receptor(float nx, float ny, float nvx, float nvy)
  {
    x = nx;
    y = ny;
    vx = nvx;
    vy = nvy;
  }
  void update()
  {
    //stroke(255, 0, 0);
    //fill(100);
    //ellipse(x, y, dens, dens);
    //line(x, y, vx + x, vy + y);
    //print(vx + " ");
  }
}
