

import java.util.*;

int num_rocks = 10;
int num_clouds = 8;
int num_grass = 10;


float accum_length;
PVector center; 
List<Polygon> polygons = new ArrayList<Polygon>();

void setup()
{
  size(800, 600);
  smooth();

  center = new PVector(width / 2, height / 2);

  createPolygons();
}

void keyPressed()
{
  createPolygons();
}

void createPolygons()
{
  polygons.clear();
  
  polygons.add(createRegularPolygon(center, 800, 4, random(-0.1, 0.1), color(130, 140, 200)));

  for(int i = 0; i < num_clouds; ++i) 
  {
    PVector rv = new PVector(random(-500, 500), random(-50, 150));
    polygons.add(createCloud(PVector.add(PVector.add(center, new PVector(0, -200)), rv), color(180 +random(10))));
  }
  
  List<Integer> table = new ArrayList<Integer>();
  
  for(int i = 0; i < num_grass; ++i)
    table.add(i);
  
  Collections.shuffle(table, new Random((int)random(1000)));
  
  for(int j = 0; j < num_grass; ++j)
  {
    int i = table.get(j);
    PVector org = new PVector(0 + (float)i * (float)width / (float)num_grass, (float)height - 10.0f);
    polygons.add(createRegularPolygon(org, 70 + random(60), 5, random(-1, 1), lerpColor(color(150, 255, 100 + random(50)), color(150), 0.3) ));
  }
  
  for (int i = 0; i < num_rocks; ++i)
  {
    PVector org = PVector.add(center, new PVector(random(-170, 170), random(0, 50) + 120));
    int degree = 3 + (int)random(5);
    float radius = 10 + random(100);
    float angle = random(TWO_PI);
    
    color c0 = lerpColor(color(150, 100, 10), color(100), 0.5);
    color c1 = lerpColor(color(80, 50, 0), color(100), 0.5);
    
    polygons.add(createRegularPolygon(org, radius, degree, angle, lerpColor(c0, c1, random(1))));
  }
}

class Polygon
{
  public List<PVector> ps;
  public color c;
  
  public Polygon(List<PVector> ps, color c)
  {
    this.ps = ps;
    this.c = c;
  }
}


void draw()
{
  background(0);

  accum_length = 0.0f;

  for (Polygon p : polygons)
    drawPolygon(p.ps, p.c);
}

Polygon createRegularPolygon(PVector org, float radius, int degree, float angle, color c)
{
  List<PVector> poly = new ArrayList<PVector>();
  for (int i = 0; i < degree; ++i)
  {
    float ang = angle + (float)i / (float)degree * TWO_PI + QUARTER_PI;
    poly.add(PVector.add(org, new PVector(cos(ang) * radius, sin(ang) * radius)));
  }
  return new Polygon(poly, c);
}

Polygon createCloud(PVector org, color c)
{
  List<PVector> poly = new ArrayList<PVector>();
  int np = 20;
  float ns = random(100.0f);
  for (int i = 0; i < np; ++i)
  {
    float ang = (float)i / (float)np * TWO_PI;
    float radius = 30.0f + noise(ang * 1.1f + ns) * 80.0f;
    poly.add(PVector.add(org, new PVector(cos(ang) * radius * 2.0f, sin(ang) * radius)));
  }
  return new Polygon(poly, c);
}

void drawPolygon(List<PVector> points, color c)
{
  strokeWeight(2);

  drawPolygonInterior(points, c);

  stroke(0, 0, 50);
  strokeWeight(0.5);

  drawPolygonOutline(points);
}

void drawPolygonOutline(List<PVector> points)
{
  PVector pv = null;
  for (PVector v : points)
  {
    if (pv != null)
      sketchLine(pv, v, 5);
    pv = v;
  }
  sketchLine(pv, points.get(0), 5);
}

void drawPolygonInterior(List<PVector> points, color c)
{
  PVector stroke_dir = new PVector(-1, 2);
  stroke_dir.normalize();
  PVector stroke_norm = new PVector(stroke_dir.y, -stroke_dir.x);
  float mind = 1e6f, maxd = -1e6f;
  float step_size = 1.0f;

  List<PVector> ext_points = new ArrayList<PVector>(points);
  ext_points.add(ext_points.get(0));

  for (PVector v : points)
  {
    float d = v.dot(stroke_norm);
    mind = min(mind, d);
    maxd = max(maxd, d);
  }

  mind -= 80.0f;
  maxd += 80.0f;

  for (float x = mind; x < maxd; x += step_size)
  {
    PVector ro = PVector.mult(stroke_norm, x);
    PVector rd = stroke_dir;

    PVector pv = null;

    SortedSet<Float> intersections = new TreeSet<Float>();

    for (PVector v : ext_points)
    {
      if (pv != null)
      {
        PVector its = clipRay(ro, rd, v, pv);

        if (its != null)
        {
          float t = PVector.dot(PVector.sub(its, ro), rd);
          intersections.add(t);
        }
      }

      pv = v;
    }

    stroke(lerpColor(c, color(0), noise(x) * 0.05));

    boolean inside = false;
    float pf = 0.0f;
    for(float f : intersections)
    {
      inside = !inside;
      if(!inside)
      {
        float t0 = pf + 10.0f, t1 = f - 10.0f;
        
        if(t1 > t0)
          sketchLine(PVector.add(ro, PVector.mult(rd, t0)),
                     PVector.add(ro, PVector.mult(rd, t1)), 5);
      }
      pf = f;
    }
 
  }  

}

PVector clipRay(PVector ro, PVector rd, PVector pa, PVector pb)
{
  PVector pd = PVector.sub(pb, pa);
  PVector pn = new PVector(pd.y, -pd.x);
  pn.normalize();

  float t = -PVector.dot(PVector.sub(ro, pa), pn) / PVector.dot(rd, pn);

  PVector its = PVector.add(ro, PVector.mult(rd, t));

  float d = PVector.sub(its, pa).dot(pd) / pd.mag();

  if (d >= 0.0f && d <= pd.mag()) 
    return its;
  else
    return null;
}


void sketchLine(PVector va, PVector vb, float segment_length)
{
  PVector vd = PVector.sub(vb, va);
  PVector vt = new PVector(vd.y, -vd.x);

  vt.normalize();

  float len = vd.mag();

  int num_segments = (int)ceil(len / segment_length);

  PVector pvc = null;

  for (int i = 0; i <= num_segments; ++i)
  {
    float t = sketchCurve((float)i / (float)num_segments, len);

    PVector vc = sketchPoint(t, va, vb, vt);

    if (pvc != null)
    {
      line(pvc.x, pvc.y, vc.x, vc.y);
      accum_length += PVector.dist(pvc, vc);
    }

    pvc = vc;
  }
}

float sketchCurve(float t, float len)
{
  return ((t * len) + cos(t * len * 0.5 + accum_length) * 20.0) / len;
}

PVector sketchPoint(float t, PVector va, PVector vb, PVector vt)
{
  PVector vc = lerpVectors(va, vb, t);
  float f = 0.05;
  vc = PVector.add(vc, PVector.mult(vt, (noise(accum_length * f) - 0.5) * 7.0 + (noise(accum_length * f * 0.05) - 0.5) * 13.0));
  return vc;
}

PVector lerpVectors(PVector a, PVector b, float x)
{
  return PVector.add(PVector.mult(a, 1.0f - x), PVector.mult(b, x));
}




