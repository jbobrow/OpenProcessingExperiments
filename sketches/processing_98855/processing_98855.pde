

import java.util.*;

void setup()
{
  size(800, 600);
  smooth();
  noFill();
  frameRate(12);
}


int grid_width = 64, grid_height = 64;
float[][] dists = new float[grid_width + 1][grid_height + 1];
float accum_length;
float sketch_segment_length = 10;

List<Line> lines = new ArrayList<Line>();
Map<Integer, List<Line>> loops = new HashMap<Integer, List<Line>>();

class Line
{
  public PVector v0;
  public PVector v1;
  public int loop = -1;
}

void addLine(PVector v0, PVector v1)
{
  Line l = new Line();
  l.v0 = v0;
  l.v1 = v1;
  lines.add(l);
}

void draw()
{
  background(0);

  lines.clear();
  loops.clear();

  accum_length = 0.0f;

  float t = (float)millis() / 1000.0f;

  generateFieldLines(t);
  addBorder();
  detectLoops();

  strokeWeight(2);
  sketch_segment_length = 15;
  fillShapes(color(50, 100, 50), color(30, 30, 60));


  stroke(255);
  strokeWeight(1);
  sketch_segment_length = 3;

  for(List<Line> list : loops.values())
  {
    for(Line l : list)
      sketchLine(l.v0, l.v1, sketch_segment_length);
  }
}

void generateFieldLines(final float t)
{
  for(int y = 0; y < grid_height + 1; ++y)
    for(int x = 0; x < grid_width + 1; ++x)
    {
      if(x == 0 || y == 0 || x == grid_width || y == grid_height)
        dists[x][y] = 0.0f;
      else
      {
        float u = (float)x, v = (float)y;
        dists[x][y] = sin(u * 0.1f + cos(v * 0.12f + t) ) * cos(v * 0.1f + sin(u * 0.12f + t * 0.3f)) - 0.2f;
        dists[x][y] += (cos(u * 0.02f * 8.0f) * sin(v * 0.013f * 8.0f) - 0.4f) * 0.4f;
      }
    }
  
  for(int y = 0; y < grid_height; ++y)
    for(int x = 0; x < grid_width; ++x)
    {
      drawGridCell(x, y, dists[x][y], dists[x + 1][y], dists[x][y + 1], dists[x + 1][y + 1]);
    }
}

void addBorder()
{
  int ox = mouseX - 400, oy = mouseY - 300;
  addSquare(new PVector(200 + ox, 200 + oy), new PVector(width - 200 + ox, height - 200 + oy));
}

void detectLoops()
{
  int loop = -1;
  for(Line l0 : lines)
  {
    if(l0.loop == -1)
    {
      ++loop;
      l0.loop = loop;
      
      for(;;)
      {
        boolean found = false;
        
        for(Line l1 : lines)
        {
          if(l0 != l1 && l1.loop != l0.loop && (pointsAreEqual(l0.v0, l1.v0) || pointsAreEqual(l0.v1, l1.v0) ||
             pointsAreEqual(l0.v0, l1.v1) || pointsAreEqual(l0.v1, l1.v1)))
          {
            l1.loop = l0.loop;
            found = true;
            l0 = l1;
            break;
          }
        }
       
        if(!found)
          break;
      }
    }
  }

  for(Line l : lines)
  {
    if(!loops.containsKey(l.loop))
      loops.put(l.loop, new ArrayList<Line>());
     
    List<Line> list = loops.get(l.loop);
    list.add(l); 
  }
}

boolean pointsAreEqual(final PVector v0, final PVector v1)
{
  return PVector.dist(v0, v1) < 1;
}

void addSquare(final PVector v0, final PVector v1)
{
  PVector v2 = new PVector(v1.x, v0.y);
  PVector v3 = new PVector(v0.x, v1.y);
  addLine(v0, v2);
  addLine(v2, v1);
  addLine(v1, v3);
  addLine(v3, v0);
}

void fillShapes(final color interior_colour, final color exterior_colour)
{
  PVector stroke_dir = new PVector(-20, 2);
  stroke_dir.normalize();
  PVector stroke_norm = new PVector(stroke_dir.y, -stroke_dir.x);
  float mind = 1e6f, maxd = -1e6f;
  float step_size = 10.0f;

  mind = 0.0f;
  maxd = +1000.0f;

  for (float x = mind; x < maxd; x += step_size)
  {
    PVector ro = PVector.mult(stroke_norm, x);
    PVector rd = stroke_dir;

    SortedSet<Float> intersections = new TreeSet<Float>();

    for (Line l : lines)
    {
      PVector its = clipRay(ro, rd, l.v0, l.v1);

      if (its != null)
      {
        float t = PVector.dot(PVector.sub(its, ro), rd);
        intersections.add(t);
      }
    }

    boolean inside = false;
    int count = 0;
    float pf = -1e3f;
    for(float f : intersections)
    {
      inside = !inside;
      
      if(!inside)
        stroke(interior_colour);
      else
        stroke(exterior_colour);
        
        float t0 = pf + 10.0f, t1 = f - 10.0f;
        
        ++count;
       
        if(t1 > t0)
          sketchLine(PVector.add(ro, PVector.mult(rd, t0)),
                     PVector.add(ro, PVector.mult(rd, t1)), sketch_segment_length);
      pf = f;
    }

    if(!inside)
    {
      stroke(exterior_colour);
      float t0 = pf + 10.0f, t1 = 700.0f;
      
      ++count;
     
      if(t1 > t0)
        sketchLine(PVector.add(ro, PVector.mult(rd, t0)),
                   PVector.add(ro, PVector.mult(rd, t1)), sketch_segment_length);
    }
 
  }  

}

PVector clipRay(PVector ro, PVector rd, PVector pa, PVector pb)
{
  PVector pd = PVector.sub(pb, pa);
  PVector pn = new PVector(pd.y, -pd.x);
  pn.normalize();

  float d = PVector.dot(rd, pn);
  
  if(d == 0.0f)
    return null;
  
  float t = -PVector.dot(PVector.sub(ro, pa), pn) / d;
  PVector its = PVector.add(ro, PVector.mult(rd, t));
  float p = PVector.sub(its, pa).dot(pd) / pd.mag();

  if (p >= 0.0f && p <= pd.mag()) 
    return its;
  else
    return null;
}


void drawGridCell(final int x, final int y,
      final float d00, final float d10, final float d01, final float d11)
{
  int code = 0;
  
  if(d00 <= 0)
    code |= 1;

  if(d10 <= 0)
    code |= 2;

  if(d11 <= 0)
    code |= 4;

  if(d01 <= 0)
    code |= 8;

  int x0 = (x + 0) * width / grid_width,
      y0 = (y + 0) * height / grid_height;

  int x1 = (x + 1) * width / grid_width,
      y1 = (y + 1) * height / grid_height;

  float[] ds = { d00, d10, d11, d01 };
  
  int[][] ps = { { x0, y0 }, { x1, y0 },
                 { x1, y1 }, { x0, y1 } };

  switch(code)
  {
    case 1:
      drawGridCell_1(ds, ps, 0);
      break;

    case 2:
      drawGridCell_1(ds, ps, 1);
      break;

    case 3:
      drawGridCell_2(ds, ps, 0);
      break;

    case 4:
      drawGridCell_1(ds, ps, 2);
      break;
      
    case 5:
      drawGridCell_3(ds, ps, 2);
      break;
      
    case 6:
      drawGridCell_2(ds, ps, 1);
      break;
      
    case 7:
      drawGridCell_4(ds, ps, 1);
      break;

    case 8:
      drawGridCell_1(ds, ps, 3);
      break;

    case 9:
      drawGridCell_2(ds, ps, 3);
      break;

    case 10:
      drawGridCell_3(ds, ps, 1);
      break;
      
    case 11:
      drawGridCell_4(ds, ps, 0);
      break;      

    case 12:
      drawGridCell_2(ds, ps, 2);
      break; 

    case 13:
      drawGridCell_4(ds, ps, 3);
      break;

    case 14:
      drawGridCell_4(ds, ps, 2);
      break;
  }
}


// one corner
void drawGridCell_1(float[] ds, int[][] ps, int rot)
{
  int i0 = (rot + 0) & 3, i1 = (rot + 1) & 3,
      i2 = (rot + 2) & 3, i3 = (rot + 3) & 3;
  
  float t0 = isopoint(ds[i0], ds[i1]),
        t1 = isopoint(ds[i0], ds[i3]);
  
  PVector v0 = new PVector(ps[i0][0] + t0 * (ps[i1][0] - ps[i0][0]),
                           ps[i0][1] + t0 * (ps[i1][1] - ps[i0][1]));
  
  PVector v1 = new PVector(ps[i0][0] + t1 * (ps[i3][0] - ps[i0][0]),
                           ps[i0][1] + t1 * (ps[i3][1] - ps[i0][1]));

  addLine(v0, v1);
}

// two corners adjacent
void drawGridCell_2(float[] ds, int[][] ps, int rot)
{
  int i0 = (rot + 0) & 3, i1 = (rot + 1) & 3,
      i2 = (rot + 2) & 3, i3 = (rot + 3) & 3;
  
  float t0 = isopoint(ds[i1], ds[i2]),
        t1 = isopoint(ds[i0], ds[i3]);

  PVector v0 = new PVector(ps[i1][0] + t0 * (ps[i2][0] - ps[i1][0]),
                           ps[i1][1] + t0 * (ps[i2][1] - ps[i1][1]));
  
  PVector v1 = new PVector(ps[i0][0] + t1 * (ps[i3][0] - ps[i0][0]),
                           ps[i0][1] + t1 * (ps[i3][1] - ps[i0][1]));

  addLine(v0, v1);
}

// two corners opposite
void drawGridCell_3(float[] ds, int[][] ps, int rot)
{
  int i0 = (rot + 0) & 3, i1 = (rot + 1) & 3,
      i2 = (rot + 2) & 3, i3 = (rot + 3) & 3;
  
  float t0 = isopoint(ds[i0], ds[i1]),
        t1 = isopoint(ds[i1], ds[i2]),
        t2 = isopoint(ds[i2], ds[i3]),
        t3 = isopoint(ds[i3], ds[i0]);
  
  PVector v0 = new PVector(ps[i0][0] + t0 * (ps[i1][0] - ps[i0][0]),
                           ps[i0][1] + t0 * (ps[i1][1] - ps[i0][1]));
  
  PVector v1 = new PVector(ps[i3][0] + t3 * (ps[i0][0] - ps[i3][0]),
                           ps[i3][1] + t3 * (ps[i0][1] - ps[i3][1]));

  PVector v2 = new PVector(ps[i1][0] + t1 * (ps[i2][0] - ps[i1][0]),
                           ps[i1][1] + t1 * (ps[i2][1] - ps[i1][1]));
  
  PVector v3 = new PVector(ps[i2][0] + t2 * (ps[i3][0] - ps[i2][0]),
                           ps[i2][1] + t2 * (ps[i3][1] - ps[i2][1]));

  addLine(v0, v1);
  addLine(v2, v3);
}



// three corners
void drawGridCell_4(float[] ds, int[][] ps, int rot)
{
  int i0 = (rot + 0) & 3, i1 = (rot + 1) & 3,
      i2 = (rot + 2) & 3, i3 = (rot + 3) & 3;
  
  float t0 = isopoint(ds[i1], ds[i2]),
        t1 = isopoint(ds[i2], ds[i3]);
  
  PVector v0 = new PVector(ps[i1][0] + t0 * (ps[i2][0] - ps[i1][0]),
                           ps[i1][1] + t0 * (ps[i2][1] - ps[i1][1]));
  
  PVector v1 = new PVector(ps[i2][0] + t1 * (ps[i3][0] - ps[i2][0]),
                           ps[i2][1] + t1 * (ps[i3][1] - ps[i2][1]));

  addLine(v0, v1);
}

float isopoint(float d0, float d1)
{
  return abs(d0) / (abs(d0) + abs(d1));
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




