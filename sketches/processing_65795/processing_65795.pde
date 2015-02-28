
int tailSegments = 4;
int tailCurviness = 10;
int tailSize;
int numPlatforms = 10;
PVector p;
PVector r[], s[];
PVector tail[];
PVector pvel;
float noiseScale = 0.001;
float noiseCount = 0;

void setup()
{
  size (400, 300);
  p = new PVector (random(width), random(height));
  r = new PVector[numPlatforms];
  s = new PVector[numPlatforms];
  for (int i=0; i<numPlatforms; i++)
  {
    r[i] = new PVector (0,0);
    s[i] = new PVector (0,0);
  }
  float xvel = random (1., 3);
  float yvel = random (1., 3);
  if (random(1.0)<0.5) xvel *= -1;
  if (random(1.0)<0.5) yvel *= -1;
  pvel = new PVector (xvel, yvel);
  smooth();
  tailSize = tailSegments * tailCurviness;
  tail = new PVector [tailSize];
  for (int i=0; i<tailSize; i++)
  {
    tail[i] = new PVector (p.x, p.y);
  }
}

void draw()
{
  background(0);
  stroke(255, 200);
  noFill();
  beginShape();
  vertex(p.x, p.y);
  for (int i=0; i<tailSize; i+=tailCurviness)
  {
    curveVertex(tail[i].x, tail[i].y);
  }
  endShape();
  boolean collided = false;
  for (int i=0; i<numPlatforms; i++)
  {
    r[i].x = noise(noiseCount, i, 0)*width;
    r[i].y = noise(noiseCount, i, noiseCount)*height;
    s[i].x = r[i].x + noise(noiseCount, i, 2)*800-400;
    s[i].y = r[i].y + noise(noiseCount, i, 3)*600-300;
    strokeWeight(2);
    stroke(20, 200, 50);
    line (r[i].x, r[i].y, s[i].x, s[i].y);
    strokeWeight(1);
    if (findIntersection(p, r[i], s[i])) collided = true;
  }
  if (!collided) fill(0, 50, 255);
  else fill(255, 0, 10);
  noStroke();
  ellipse(p.x, p.y, 11, 11);
  p.x += pvel.x;
  p.y += pvel.y;
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
  for (int i=tailSize-1; i>0; i--)
  {
    tail[i].x = tail[i-1].x;
    tail[i].y = tail[i-1].y;
  }
  tail[0].x = p.x;
  tail[0].y = p.y;
  noiseCount += noiseScale;
}

boolean findIntersection(PVector _p, PVector _r, PVector _s)
{
  boolean result = false;
  PVector _q = new PVector (_p.x + pvel.x, _p.y + pvel.y);
  float A1 = _q.y - _p.y;
  float B1 = _p.x - _q.x;
  float C1 = A1 * _p.x + B1 * _p.y;

  // line of reflection
  float A2 = _s.y - _r.y;
  float B2 = _r.x - _s.x;
  float C2 = A2 * _r.x + B2 * _r.y;
  float det = A1 * B2 - A2 * B1;
  if (det==0)
  {
    //println("Lines are parallel");
  }
  else

  {
    float x = (B2*C1 - B1*C2)/det;
    float y = (A1*C2 - A2*C1)/det;
    boolean inX1range = (x >= min (_p.x, _q.x)) && (x <= max(_p.x, _q.x));
    boolean inY1range = (y >= min (_p.y, _q.y)) && (y <= max(_p.y, _q.y));
    boolean inX2range = (x >= min (_r.x, _s.x)) && (x <= max(_r.x, _s.x));
    boolean inY2range = (y >= min (_r.y, _s.y)) && (y <= max(_r.y, _s.y));
    if (inX1range && inY1range && inX2range && inY2range)
      // bounce!
    {
      noStroke();
      fill(255, 0, 0);
      ellipse(x, y, 10, 10);
      float a = A2 * -1 / B2;
      float c = C2 / B2;
      float d = (_p.x + (_p.y - c) * a) / (1 + a*a);
      float xref = 2*d - _p.x;
      float yref = 2*d*a - _p.y + 2*c;
      PVector intersection = new PVector (x, y);
      PVector reflected = new PVector (xref, yref);
      PVector segment = PVector.sub(reflected, intersection);
      PVector velmag = PVector.sub(_q, _p);
      // not optimal since it uses 2 sqrts
      float scalar = velmag.mag() / segment.mag();
      p.x = xref;
      p.y = yref;      
      pvel.x = (x-xref)*scalar;
      pvel.y = (y-yref)*scalar;
      result = true;
    }
  }
  return result;
}

void keyPressed()
{
    p = new PVector (random(width), random(height));
    float xvel = random (1., 3);
    float yvel = random (1., 3);
    if (random(1.0)<0.5) xvel *= -1;
    if (random(1.0)<0.5) yvel *= -1;
    pvel = new PVector (xvel, yvel);
    for (int i=0; i<tailSize; i++)
    {
      tail[i] = new PVector (p.x, p.y);
    }
  }
