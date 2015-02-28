
class Face
{
  // The three points of the face
  PVector[] ps;
    
  // Constructor
  Face(PVector a, PVector b, PVector c)
  {
    ps = new PVector[] {a, b, c};    
    this.CClockwise();
  }
  
  // Check to see if they're in counter clockwise order, if not, adjust
  void CClockwise()
  {
    if((ps[1].x - ps[0].x) * (ps[2].y - ps[0].y) - (ps[2].x - ps[0].x) * (ps[1].y - ps[0].y) > 0)
    {
      // By swapping the 2nd and 3rd verts, we are gaurenteed to reverse the direction
      PVector t = ps[1];
      ps[1] = ps[2];
      ps[2] = t;
    }
  }
  
  void draw()
  {
    triangle(ps[0].x, ps[0].y, ps[1].x, ps[1].y, ps[2].x, ps[2].y);
  }
  
  // Code from: http://www.blackpawn.com/texts/pointinpoly/default.html
  // Check if p is inside the face
  boolean InTriangle(PVector p)
  {
    PVector v0 = PVector.sub(ps[2], ps[0]);
    PVector v1 = PVector.sub(ps[1], ps[0]);
    PVector v2 = PVector.sub(p, ps[0]);
    
    // Compute dot products
    float dot00 = PVector.dot(v0, v0);
    float dot01 = PVector.dot(v0, v1);
    float dot02 = PVector.dot(v0, v2);
    float dot11 = PVector.dot(v1, v1);
    float dot12 = PVector.dot(v1, v2);
    
    float invDenom = 1.0 / (dot00 * dot11 - dot01 * dot01);
    float u = (dot11 * dot02 - dot01 * dot12) * invDenom;
    float v = (dot00 * dot12 - dot01 * dot02) * invDenom;

    // Check if point is in triangle
    return (u >= 0) && (v >= 0) && (u + v < 1);
  }
  
  // Check if p is inside the circumscribed circle
  boolean InCircle(PVector p)
  {
    float [] cir = calcCircle(ps[0], ps[1], ps[2]);
    
    if(dist(cir[0], cir[1], p.x, p.y) < cir[2]) return true;
    else return false;
  }
  
  // Very messy code :(
  // Flip the common edge between this face and f
  void flip(Face f)
  {
    // Convert both of the faces' verts to an ArrayList
    ArrayList<PVector> l1 = new ArrayList<PVector>(Arrays.asList(ps));
    ArrayList<PVector> l2 = new ArrayList<PVector>(Arrays.asList(f.ps));
    
    // Keep what is common in both
    l2.retainAll(l1);
    
    // To flip a common edge, l2 must be 2 since they should share 2 verts
    if(l2.size() != 2) return;
    
    // Find the unique verts for each face
    PVector p1 = null;
    PVector p2 = null;
    
    for(int i = 0; i < 3; ++i)
    {
      p1 = ps[i];
      if(!l2.contains(p1))
        break;
    }
    for(int i = 0; i < 3; ++i)
    {
      p2 = f.ps[i];
      if(!l2.contains(p2))
        break;
    }
    
    // Do this instead of creating new faces
    ps = new PVector[] {p1, p2, l2.get(0)};
    f.ps = new PVector[] {p1, p2, l2.get(1)};
    this.CClockwise();
    f.CClockwise();
  }
  
  // Find the adjacent face (i.e. shares 2 verts) and opposite (i.e. 
  // neither of the common verts are p)
  Face getAdjacent(PVector p)
  { 
    ArrayList<PVector> l1 = new ArrayList<PVector>(Arrays.asList(ps));
    
    for(int i = 0; i < faces.size(); ++i)
    {
      Face f = faces.get(i);
      if(f == this) continue;
      
      ArrayList<PVector> l2 = new ArrayList<PVector>(Arrays.asList(f.ps));
      
      l2.retainAll(l1);
      
      // Must have 2 ponits in common and those two points must not be p
      if(l2.size() == 2 && !l2.contains(p))
        return f;
    }
    
    // Does not have an adjacent and opposite face
    return null;
  }
}

ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<Face> faces = new ArrayList<Face>();

void setup()
{
  size(400, 400);
  smooth();
  
  // These are three hidden points to start with, referenced as the 'omega face'
  // No real magic here, just make sure its big enough to cover the screen
  points.add(new PVector(width / 2, -5000));
  points.add(new PVector(-5000, height));
  points.add(new PVector(width + 5000, height));
  
  // Add 3 points for the first face
  for(int i = 0; i < 3; ++i)
    points.add(new PVector(random(width*.25, width*.75), random(height*.25, height*.75)));
  
  noLoop();
}

void draw()
{
  background(120);
  
  // Go go gadget magic!
  Delaunay();
  
  drawTriangulation();
  drawConvexHull();
  
  // Draw the points
  fill(0);
  stroke(0);
  for(int i = 0; i < points.size(); ++i)
    ellipse(points.get(i).x, points.get(i).y, 5, 5);
}

// Helper function
void ValidEdge(Face f, PVector p)
{
  Face fadj = f.getAdjacent(p);
  
  if(fadj == null) return;
  
  // If it is inside the circle, it is illegal
  if(fadj.InCircle(p))
  {
    // So flip the adjacent edge, and re-validate the two new faces
    fadj.flip(f);
    ValidEdge(f, p);
    ValidEdge(fadj, p);
  }
}

void Delaunay()
{
  faces.clear();
  
  if(points.size() < 6) return;
  
  // Add the omega face to start with
  faces.add(new Face(points.get(0), points.get(1), points.get(2)));
  
  // Incrementally add all the points
  for(int i = 3; i < points.size(); i++)
  {
    PVector p = points.get(i);
    Face f = null;
    
    // Find the face that this point is inside of
    for(int j = 0; j < faces.size(); ++j)
    {
      f = faces.get(j);
      if(f.InTriangle(p))
        break;
    }
    
    // For now lest just pretend it is always inside the triangle
    // since technically it could be on the edge
    if(true) 
    {
      // Remove the face that is getting broken up
      faces.remove(f);
      
      // Break this face into 3 new faces using the added
      // point as the common point between all of them
      Face f1 = new Face(p, f.ps[0], f.ps[1]);
      Face f2 = new Face(p, f.ps[1], f.ps[2]);
      Face f3 = new Face(p, f.ps[2], f.ps[0]);
      
      faces.add(f1);
      faces.add(f2);
      faces.add(f3);
      
      // Now make sure each face is valid
      ValidEdge(f1, p);
      ValidEdge(f2, p);
      ValidEdge(f3, p);
    }
    else // on the edge
    {
    }
  }
}
void drawTriangulation()
{
  // Make an array list of the points in the omega face
  ArrayList<PVector> l1 = new ArrayList<PVector>(points.subList(0,3));
  
  // Draw the triangulation
  pushStyle();
  stroke(0);
  fill(200);
  for(int j = 0; j < faces.size(); ++j)
  {
    Face f = faces.get(j);
    ArrayList<PVector> l2 = new ArrayList<PVector>(Arrays.asList(f.ps));
    l2.retainAll(l1);
    
    // Skip faces that have a point in the omega face
    if(l2.size() == 0)
      f.draw();
  }
  popStyle();
}
void drawConvexHull()
{
  // Make an array list of the points in the omega face
  ArrayList<PVector> l1 = new ArrayList<PVector>(points.subList(0,3));
  
  // Draw the convex hull
  pushStyle();
  strokeWeight(5);
  stroke(0, 180, 0);
  for(int j = 0; j < faces.size(); ++j)
  {
    Face f = faces.get(j);
    ArrayList<PVector> l2 = new ArrayList<PVector>(Arrays.asList(f.ps));
    l2.retainAll(l1);
    
    // If a face shares 1 point in common with the omega face
    // then just draw the 1 edge of the face that does not contain
    // that point in common.
    if(l2.size() == 1)
    {
      PVector[] a = new PVector[2];
      int index = 0;
      for(int i = 0; i < l1.size(); ++i)
        if(!f.ps[i].equals(l2.get(0)))
          a[index++] = f.ps[i];
      line(a[0].x, a[0].y, a[1].x, a[1].y);
    }
  }
  popStyle();
}

// Code from Nate Wilson on openprocessing
// http://www.openprocessing.org/sketch/45489
// Returns a float array where:
//   ret[0] = X location
//   ret[1] = Y location
//   ret[2] = radius
float[] calcCircle(PVector p1, PVector p2, PVector p3)
{
  // two slopes from points
  float slope1 = (p1.y-p2.y)/(p1.x-p2.x);
  float slope2 = (p2.y-p3.y)/(p2.x-p3.x);
  float ret[] = new float[3];
  
  // make sure that the points aren't in a line
  if(slope1 != slope2)
  {
    // center X
    ret[0] = (slope1*slope2*(p3.y-p1.y) + slope1*(p2.x+p3.x) - slope2*(p1.x+p2.x))/(2*(slope1-slope2));
    // center Y
    ret[1] = -1/slope1*(ret[0]-(p1.x+p2.x)/2)+(p1.y+p2.y)/2;
    // radius
    ret[2] = dist(ret[0], ret[1], p2.x, p2.y);
  }
  
  // We will pretend it always works... :(
  return ret;
}

void mousePressed()
{
  points.add(new PVector(mouseX, mouseY));
  redraw();
}
void mouseDragged()
{
  points.get(points.size() - 1).x = mouseX;
  points.get(points.size() - 1).y = mouseY;
  redraw();
}

