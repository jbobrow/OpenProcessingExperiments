
PVector p;
PVector pvel;
PVector r[], s[];
float noiseVal[];
final int numPlatforms = 6;
final float noiseScale = 0.01;
final float friction = -0.02;
final float gravity = 0.03;
final float maxVel = 10;
final int history = 60;
float xhist[], yhist[];
int index = 0;
Reflection refl;
boolean bordersOn = false;

void setup()
{
  size (640, 480);
  refl = new Reflection();
  p = new PVector (width/2, 0);
  r = new PVector[numPlatforms];
  s = new PVector[numPlatforms];
  noiseVal = new float[numPlatforms];
  for (int i=0; i<numPlatforms; i++)
  {
    r[i] = new PVector (random(width), random(height));
    s[i] = new PVector (random(width), random(height));
    noiseVal[i] = random(0, 1.);
  }
  xhist = new float[history];
  yhist = new float[history];
  mouseX = width/2;
  mouseY = height/2;
  for (int i=0; i<history; i++)
  {
    xhist[i] = width/2;
    yhist[i] = height/2;
  }
  float xvel = random (0.1, 2);
  float yvel = 0;
  if (random(1.0)<0.5) xvel *= -1;
  pvel = new PVector (xvel, yvel);
  smooth();
  background(0);
  noiseDetail(8, 0.5);
}

void draw()
{
  if (bordersOn)
  {
    strokeWeight(3);
    stroke(255);
  }
  else noStroke();
  fill(0, 20);
  rect(0, 0, width, height);
  stroke(255, 100);
  noFill();
  strokeWeight(5);
  stroke(255, 0, 0);
  line (r[0].x, r[0].y, s[0].x, s[0].y);
  for (int i=1; i<numPlatforms; i++)
  {
    r[i].x += noise(noiseVal[i], 0., i*1.)-.5;
    r[i].y += noise(noiseVal[i], 1., i*1.)-.5;
    s[i].x += noise(noiseVal[i], 2., i*1.)-.5;
    s[i].y += noise(noiseVal[i], 3., i*1.)-.5;
    noiseVal[i] += noiseScale;
    r[i].x = constrain(r[i].x, 5, width-5);
    r[i].y = constrain(r[i].y, 20, height-5);
    s[i].x = constrain(s[i].x, 5, width-5);
    s[i].y = constrain(s[i].y, 20, height-5);
    stroke(i*255./numPlatforms, 100, 0);
    line (r[i].x, r[i].y, s[i].x, s[i].y);
  }
  strokeWeight(1);
  boolean collided = false;
  PVector p2 = new PVector(p.x+pvel.x, p.y+pvel.y);
  for (int i=0; i<numPlatforms; i++)
  {
    if (refl.checkIntersect2(p, p2, r[i], s[i]))
    {
      refl.bounce();
      p = refl.getReflected();
      pvel = refl.getVelocity();
      applyFriction();
      strokeWeight(20);
      if (i==0) stroke(255, 0, 0);
      else
        stroke(i*255./numPlatforms, 100, 0);
      line (r[i].x, r[i].y, s[i].x, s[i].y);

      break;
    }
  }
  p.x += pvel.x;
  p.y += pvel.y;
  applyGravity();
  noStroke();
  fill(0, 50, 255);
  ellipse(p.x, p.y, 8, 8);
  if (bordersOn)
    checkBorders2();
  else checkBorders1();
  maxVelocity();
}

void moveUserPlatform()
{
  r[0].x = mouseX;
  r[0].y = mouseY;
  s[0].x = xhist[(index+1)%history];
  s[0].y = yhist[(index+1)%history];
  index = (index+1)%history;
  xhist[index] = mouseX;
  yhist[index] = mouseY;
}  

void maxVelocity()
{
  if (pvel.x > maxVel) pvel.x = maxVel;
  if (pvel.x < -maxVel) pvel.x = -maxVel;
  if (pvel.y > maxVel) pvel.y = maxVel;
  if (pvel.y < -maxVel) pvel.y = -maxVel;
}

void checkBorders1()
{
  if (p.x < 0)
  {
    p.x = width;
  }
  if (p.x > width)
  {
    p.x = 0;
  }
  if (p.y < 0)
  {
    p.y = height;
  }
  if (p.y > height)
  {
    p.y = 0;
  }
}

void checkBorders2()
{
  if (p.x < 0)
  {
    p.x = 0;
    pvel.x *= -1;
  }
  if (p.x > width)
  {
    p.x = width;
    pvel.x *= -1;
  }
  if (p.y < 0)
  {
    p.y = 0;
    pvel.y *= -1;
  }
  if (p.y > height)
  {
    p.y = height;
    pvel.y *= -1;
  }
}

void applyFriction()
{
  pvel.x *= (1-friction);
  pvel.y *= (1-friction);
}

void applyGravity()
{
  pvel.y += gravity;
}

void mousePressed()
{
  bordersOn = !bordersOn;
}

void mouseMoved()
{
  moveUserPlatform();
}

class Reflection
{
  float A1, A2, B1, B2, C1, C2, det,x,y;
  private PVector intersect;
  PVector A, B, C, D;
  PVector refl, reflVel;

  Reflection()
  {
  }

  boolean checkIntersect2(PVector _p, PVector _q, PVector _r, PVector _s)
  {
    A = _p.get();
    B = _q.get();
    C = _r.get();
    D = _s.get();
    A1 = _q.y - _p.y;
    B1 = _p.x - _q.x;
    C1 = A1 * _p.x + B1 * _p.y;

    // line of reflection
    A2 = _s.y - _r.y;
    B2 = _r.x - _s.x;
    C2 = A2 * _r.x + B2 * _r.y;
    det = A1 * B2 - A2 * B1;
    if (det==0)
    {
      return false;
    }
    x = (B2*C1 - B1*C2)/det;
    y = (A1*C2 - A2*C1)/det;
    boolean inX1range = (x >= min (A.x, B.x)) && (x <= max(A.x, B.x));
    boolean inY1range = (y >= min (A.y, B.y)) && (y <= max(A.y, B.y));
    boolean inX2range = (x >= min (C.x, D.x)) && (x <= max(C.x, D.x));
    boolean inY2range = (y >= min (C.y, D.y)) && (y <= max(C.y, D.y));
    if (!(inX1range && inY1range && inX2range && inY2range))
    {
      return false;
    }
    intersect = new PVector(x,y);
    return true;
  }

  PVector getIntersect()
  {
    return intersect;
  }

  boolean bounce()
  {
    float a = A2 * -1 / B2;
    float c = C2 / B2;
    float d = (A.x + (A.y - c) * a) / (1 + a*a);
    float xref = 2*d - A.x;
    float yref = 2*d*a - A.y + 2*c;
    PVector intersection = new PVector (x, y);
    PVector reflected = new PVector (xref, yref);
    PVector segment = PVector.sub(reflected, intersection);
    PVector velmag = PVector.sub(B, A);
    float scalar = velmag.mag() / segment.mag();
    refl = new PVector (xref, yref);
    reflVel = new PVector ((x-xref)*scalar, (y-yref)*scalar);
    return true;
  }

  PVector getReflected()
  {
    return refl;
  }

  PVector getVelocity()
  {
    return reflVel;
  }
}
