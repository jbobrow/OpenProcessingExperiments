
ArrayList points;
ArrayList tris;
ArrayList planes;

int      lockedTri;

void setup() {
  size(400, 400, P3D);
  stroke(255);
  points = new ArrayList();
  tris = new ArrayList();
  planes = new ArrayList();
  lockedTri = -1;
} 

int[] getNearestPoints(float x, float y, int itri)
{
  int      psize = points.size();
  PVector  mpos = new PVector(x, y);
  int[]    nidx = new int[2];
  float[]  dist = new float[2];

  nidx[0] = -1;
  nidx[1] = -1;
  
  dist[0] = 10000000.0;
  dist[1] = 10000000.0;
  
  if (itri != -1)
  {
    // Just use nearest point
    if (false)
    { 
      int[] tri = (int[])tris.get(itri);
      for (int i = 0; i < 3; i++)
      {
        PVector pt = (PVector) points.get(tri[i]);
        float tdist = pt.dist(new PVector(x, y));
        
        if (tdist < dist[0])
        {
          dist[1] = dist[0];
          dist[0] = tdist;
          nidx[1] = nidx[0];
          nidx[0] = tri[i];
        }
        else if (tdist < dist[1])
        {
          dist[1] = tdist;
          nidx[1] = tri[i];
        }
      }
    }
    
    // Use the plane equation so we can prefer points outside the triangle!!
    if (true)
    {
      int[] tri = (int[])tris.get(itri);
      int usePlane = 0;
      
      for (int i = 0; i < 3; i++)
      {
        float[] plane = (float[]) planes.get(3*itri+i);
        PVector n0 = new PVector(plane[0], plane[1]);
        if ((n0.dot(mpos) - plane[2]) > 0)
          usePlane = i;
      }
      
      // set the indices based on the plane
      nidx[0] = tri[usePlane];
      nidx[1] = tri[(usePlane+1)%3];
    }
  }
  else
  {
    for (int i = 0; i < psize; i++)
    {
      PVector pt = (PVector) points.get(i);
      float tdist = pt.dist(new PVector(x, y));
      
      if (tdist < dist[0])
      {
        dist[1] = dist[0];
        dist[0] = tdist;
        nidx[1] = nidx[0];
        nidx[0] = i;
      }
      else if (tdist < dist[1])
      {
        dist[1] = tdist;
        nidx[1] = i;
      }
    }
  }
  return nidx;
}

int getContainingTriangle(float x, float y)
{
  int retval = -1;
  PVector mpos = new PVector(x, y);
  
  for (int i = tris.size()-1; i >= 0; i--)
  {
    float[] plane0 = (float[]) planes.get(3*i+0);
    float[] plane1 = (float[]) planes.get(3*i+1);
    float[] plane2 = (float[]) planes.get(3*i+2);

    PVector n0 = new PVector(plane0[0], plane0[1]);
    PVector n1 = new PVector(plane1[0], plane1[1]);
    PVector n2 = new PVector(plane2[0], plane2[1]);
    
    boolean    t0 = (n0.dot(mpos) - plane0[2]) < 0;
    boolean    t1 = (n1.dot(mpos) - plane1[2]) < 0;
    boolean    t2 = (n2.dot(mpos) - plane2[2]) < 0;

    if ((t0 == t1) && (t1 == t2))
    {
      retval = i;
    }
  }
  return retval;
}

void draw() {
  background(192, 64, 0);
  //line(width/2, height/2, mouseX, mouseY);

  // Draw a point we're looking to place
  fill(255);
  if (mousePressed)
  {
    // Find 2 closest points
    if (points.size() >= 2)
    {
      int[] nidx;
      
      nidx = getNearestPoints(mouseX, mouseY, lockedTri);
  
      PVector pm = new PVector(mouseX, mouseY);
      PVector p1 = (PVector) points.get(nidx[0]);
      PVector p2 = (PVector) points.get(nidx[1]);
      
      triangle(pm.x, pm.y, p1.x, p1.y, p2.x, p2.y);
    }
    ellipse(mouseX, mouseY, 10, 10);
  }
    
  fill(0);
  {
    for (int i = points.size()-1; i >= 0; i--)
    {
      PVector p0 = (PVector) points.get(i);
      ellipse(p0.x, p0.y, 10, 10);
    }
  }
  {
    for (int i = tris.size()-1; i >= 0; i--)
    {
      int[] tri = (int[]) tris.get(i);
      
      PVector p0 = (PVector) points.get(tri[0]);
      PVector p1 = (PVector) points.get(tri[1]);
      PVector p2 = (PVector) points.get(tri[2]);
      
      triangle(p0.x, p0.y, p1.x, p1.y, p2.x, p2.y);
    }
  }
}

void mousePressed()
{
  int i = getContainingTriangle(mouseX, mouseY);
  println("woo triangle " + i + "!!");
  
  lockedTri = i;
}
 
void mouseReleased()
{  
  boolean addTri = (points.size() >= 2);
  
  // Add triangle with 2 closest points
  if (addTri)
  {
    int[] nidx = getNearestPoints(mouseX, mouseY, lockedTri);
    int[] tri = {points.size(), nidx[0], nidx[1]};
    
    tris.add(tri);
  }
  
  points.add(new PVector(mouseX, mouseY));
  
  if (addTri)
  {
    int[] tri = (int[]) tris.get(tris.size()-1);
    
    // Calculate the normals
    PVector p0 = (PVector) points.get(tri[0]);
    PVector p1 = (PVector) points.get(tri[1]);
    PVector p2 = (PVector) points.get(tri[2]);
    
    PVector p01 = p1.get();
    PVector p12 = p2.get();
    PVector p20 = p0.get();
    
    p01.sub(p0);
    p12.sub(p1);
    p20.sub(p2);
    
    PVector n0 = new PVector(-p01.y, p01.x);
    PVector n1 = new PVector(-p12.y, p12.x);
    PVector n2 = new PVector(-p20.y, p20.x);

    // If the triangle winding is wrong, flip the normals
    PVector pnorm = p01.cross(p12);
    if (pnorm.z > 0.0)
    {
      n0.mult(-1.0);
      n1.mult(-1.0);
      n2.mult(-1.0);
    }
    
    float[] plane0 = {n0.x, n0.y, n0.dot(p0)};
    float[] plane1 = {n1.x, n1.y, n1.dot(p1)};
    float[] plane2 = {n2.x, n2.y, n2.dot(p2)};
    
    planes.add(plane0);
    planes.add(plane1);
    planes.add(plane2);
  }
  
  lockedTri = -1;
}
  
  
  

