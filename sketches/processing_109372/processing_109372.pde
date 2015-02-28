
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/2272*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
Particle[] p;
int numP = 51200;
PGraphics pg1;

void setup() {
  size(512, 512, P2D);
  colorMode(RGB, 255);
  background(224);
  smooth();
  
  pg1 = makeTexture(2);
    
  p = new Particle[numP];
  for (int  i=0; i<numP; i++) {
    PVector a = new PVector(0.0f, 0.0f);
    PVector v = new PVector(0.0f, 0.0f);
    PVector l = new PVector(random(50, width-50), random(50, height-50));
    p[i] = new Particle(a, v, l);
    p[i].setLimit(5.0);
  }
}

void keyReleased() {
  p = new Particle[numP];
  for (int  i=0; i<numP; i++) {
    PVector a = new PVector(0.0f, 0.0f);
    PVector v = new PVector(0.0f, 0.0f);
    PVector l = new PVector(random(50, width-50), random(50, height-50));
    p[i] = new Particle(a, v, l);
    float r = 64;
    float g = 128;
    float b = 192;
    p[i].setColor(color(r, g, b, 32));
    p[i].setLimit(5.0);
  }
}

void draw() {
  background(224);
  for (int  i=0; i<numP; i++) {
    p[i].addForce(getGravForce(p[i]));
    p[i].run();
  }
}

PVector getGravForce(Particle p_) {
  PVector loc = new PVector(mouseX, mouseY);
  float mass = 10.0f;
  float g = 100;
  
  PVector dir = new PVector();
  dir = dir.sub(loc, p_.loc);
  float d = dir.mag();
  d = constrain(d, 5.0, 15.0);
  dir.normalize();
  float f = (g*mass*p_.mass)/(d*d);
  dir.mult(f);
  return dir;
}

PGraphics makeTexture(int r) {
  PGraphics res = createGraphics(r, r, P2D);
  res.beginDraw();
  res.loadPixels();
    for ( int x = 0; x < res.width; x++) {   
      for( int y = 0; y < res.height; y++ ) {
        res.pixels[y*res.width+x] = color(128, 64, 64, 64);
      }
    }
  res.updatePixels();
  res.endDraw();
  
  return res;  
}

void drawStar( PImage img, float x, float y ) {
   blend(img, 0, 0, img.width, img.height, int(x) - img.width/2, int(y) - img.height/2, img.width, img.height, SUBTRACT);
}
// Particle class for 2D space.
// Mark Brand, 22 march 2009.

class Particle 
{
  PVector acc;
  PVector vel;
  PVector loc;
  float mass;
  float lim;
  boolean isLimited;
  color c;

  // Constructor
  Particle(PVector a_, PVector v_, PVector l_, float m_)
  {
    acc = a_.get();
    vel = v_.get();
    loc = l_.get();
    mass = m_;
    lim = 0;
    isLimited = false;
    c = color(255);
  }
  
  Particle(PVector a_, PVector v_, PVector l_)
  {
    acc = a_.get();
    vel = v_.get();
    loc = l_.get();
    mass = 10;
    lim = 0;
    isLimited = false;
    c = color(255);
  }

  Particle(PVector l_)
  {
    acc = new PVector();
    vel = new PVector();
    loc = l_.get();
    mass = 10;
    lim = 0;
    isLimited = false;
    c = color(255);
  }
  
  void run() 
  {
    update();
    render();
  }
  
  void update()
  {
    vel.add(acc);
    if (isLimited) vel.limit(lim);
    loc.add(vel);
  }

  void render()
  {
    drawStar(pg1, loc.x, loc.y);
  }

  void renderVector(PVector v_, float s_)
  {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading2D());   

    float len = v_.mag()*s_; //get magnitude and scale

    line(0, 0, len, 0);
    line(len, 0, len-4, 2);
    line(len, 0, len-4, -2);
    popMatrix();
  }

  void setLimit(float l_)
  {
    lim = l_;
    isLimited = true;
  }
  
  void addForce(PVector v_) 
  {
    // force=mass*acc, added acc=force/mass
    PVector force = v_.get();
    force.div(mass);
    acc.add(force);
  }
  
  void setColor(color c_) {
    c = c_;
  }
}


