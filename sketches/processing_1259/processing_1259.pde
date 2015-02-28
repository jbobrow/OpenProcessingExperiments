
// Test of Verlet Integration to simulate kaleidoscope wheel
//
// - Jim Bumgardner
 
static final int LM = 20;
static final int TM = 20;
static final int kNbrParticles = 30;
static final int kMinRadius = 10;
static final int kMaxRadius = 100;
static final int kWidth = 500;
static final int kHeight = 500;
float  cx,cy;
 
class Particle
{
  float  x,y,r;
  color    clr;
  Particle(float x, float y, float r, float h, float s, float v)
  {
    this.x = x;
    this.y = y;
    this.r = r;
    this.clr = color(h,s,v);
  }
}
 
Particle[]    trinkets;
 
void setup()
{
  size(500,500);
   
  cx = width/2.0;
  cy = height/2.0;
   
  colorMode(HSB);
 
  frameRate(30);
   
  // Initialize cloth
  trinkets = new Particle[kNbrParticles];
  for (int  pn = 0; pn < kNbrParticles; ++pn)
  {
    float  x = cx + sin(random(3.14152*2))*width/2;   
    float  y = cy + cos(random(3.14152*2))*width/2;
    trinkets[pn] = new Particle(x, y, kMinRadius + random(kMaxRadius - kMinRadius),
                                random(256), 192, 192+random(64));
  }
}
 
 
float kGravity = 15;
float kSpinRate = 0.066;
 
static final int kNbrRenderIterations = 12;
 
void verlet()
{
  // Gravity & Rotation - once per pass
  for (int pn = 0; pn < kNbrParticles; ++pn) {
    Particle  p = trinkets[pn];
     
    // Gravity
    p.y += kGravity;
     
    // Rotation
    float dx = p.x - cx;
    float dy = p.y - cy;
    float a = atan2(dy, dx);
    float d = sqrt(dx*dx+dy*dy);
    float a2 = a + kSpinRate;
    float x2 = cx+cos(a2)*d;
    float y2 = cy+sin(a2)*d;
     
    p.x += x2 - p.x;
    p.y += y2 - p.y;
  }
   
  // Satisfy collision constraints
  for (int i = 0; i < kNbrRenderIterations; ++i)
  {
  // Bound to circle
  for (int pn = 0; pn < kNbrParticles; ++pn) {
    Particle  p = trinkets[pn];
    float dx = p.x - cx;
    float dy = p.y - cy;
    float  distL = sqrt(dx*dx+dy*dy) / (width/2-p.r);
    if (distL > 1) {
      p.x -= dx*(distL-1);
      p.y -= dy*(distL-1);
    }
  }
   
  for (int pn1 = 0; pn1 < kNbrParticles-1; ++pn1) {
    Particle  p1 = trinkets[pn1];
    for (int pn2 = pn1+1; pn2 < kNbrParticles; ++pn2) {
      Particle  p2 = trinkets[pn2];
      float dx = p2.x - p1.x;
      float dy = p2.y - p1.y;
      float dLen = sqrt(dx*dx + dy*dy);
      float rLen = (p1.r+p2.r)*.51;
 
      if (dLen < rLen)
      {
        float diff = (dLen - rLen)/dLen;
        // if (sn == 0)  println("ay = " + s.a.y + ", by = " + s.b.y + ", dlen = " + dLen + ", rLen = " + s.restLength + ", diff = " + diff);
        diff *= 0.5;
        dx *= diff;
        dy *= diff;
        p1.x += dx;
        p2.x -= dx;
        p1.y += dy;
        p2.y -= dy;
      }
    }
  }
  }
}
 
void draw()
{
  background(192);
   
  verlet();
 
  noStroke();
  smooth();
   
  // fill(0);
  for (int pn = 0; pn < kNbrParticles; ++pn) {
    Particle  p = trinkets[pn];
    fill(p.clr);
    ellipse(p.x, p.y, p.r, p.r);
  }
}



