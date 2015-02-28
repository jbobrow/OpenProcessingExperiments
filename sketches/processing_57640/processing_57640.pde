
// 2D diffusion-limited aggregation
// (c) Alasdair Turner 2009

color white = color(255);
color gray = color(128);

float system_radius = 2.0;

void setup()
{
  size(900,400);
  background(64);
  myset(new PVector(0,0));
}

void draw()
{
  float theta = random(0,TWO_PI);
  PVector ploc = new PVector(cos(theta)*system_radius,sin(theta)*system_radius);
  float phi = random(-atan(0.5),atan(0.5));
  PVector pdir = new PVector(cos(theta-PI+phi),sin(theta-PI+phi));
  boolean hit = false;
  while (!hit && ploc.mag() <= system_radius) {
    ploc.add(pdir);
    if (myget(ploc) == gray) {
      myset(ploc);
      hit = true;
    }    
  }
}

color myget(PVector pos)
{
  return get(int(pos.x + width/2),int(pos.y + height/2));
}
void myset(PVector pos)
{
  int x = int(pos.x + width/2);
  int y = int(pos.y + height/2);
  for (int i = x - 1; i <= x + 1; i++) {
    for (int j = y - 1; j <= y + 1; j++) {
      if (get(i,j) != white) {
        set(i,j,gray);
      }
    }
  }
  set(x,y,white);
  // set new system radius if appropriate
  float m = pos.mag();
  if (m * 2.0 >= system_radius) {
    system_radius = m * 2.0;
  }
}

void mousePressed()
{
  background(64);
  myset(new PVector(0,0));
  system_radius = 2.0;
}

