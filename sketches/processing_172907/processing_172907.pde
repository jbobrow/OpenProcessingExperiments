
ArrayList<Triangle> myTriangles = new ArrayList<Triangle>();
ArrayList<MyPoint> myPoints = new ArrayList<MyPoint>();
ArrayList<PVector> pvs = new ArrayList<PVector>();//vectors that will be triangulated
final int NB_POINTS = 105;
Boolean displayPoints = false, displayLines = true, fillUp = true;
PVector PMouse = new PVector(0, 0, 0);

void setup()
{
  size(330, 206, P2D);
  reset();
}

void reset()
{
  myPoints.clear();
  pvs.clear();
  // fill the points arraylist with random points
  for (int i = 0; i < NB_POINTS; i++)
  {
    PVector p = new PVector(random(width), random(height), 0);
    myPoints.add(new MyPoint(p, i));
  }
  for (int i = 0; i < NB_POINTS; i++)
  {
    pvs.add((myPoints.get(i)).pos);
  }
}

void draw()
{
  background(60);

  if ((pmouseX != mouseX) || (pmouseY != mouseY))
  {
    PMouse.set(mouseX, mouseY, 0);
  } else
  {//no point can be impacted then
    PMouse.set(-MyPoint.MAX_DIST_MOUSE, -MyPoint.MAX_DIST_MOUSE, 0);
  }
  for (int i = 0; i < NB_POINTS; i++)
  {
    ((MyPoint)myPoints.get(i)).process();
  }
  for (int i = 0; i < NB_POINTS; i++)
  {
    ((MyPoint)myPoints.get(i)).update();
  }

  // get the triangulated mesh
  myTriangles.clear();
  new Triangulator().triangulate(pvs, myTriangles);

  if (displayLines)
  {
    strokeWeight(1);
    stroke(0, 130);
  } else
  {
    noStroke();
  }
  if (!fillUp) noFill();

  beginShape(TRIANGLES);
  for (Triangle t : myTriangles)
  {
    if (fillUp) fill(map(t.p1.x, 0, width, 0, 225), map(t.p1.y, 0, height, 0, 225), 225);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();

  // draw the points
  if (displayPoints)
  {
    strokeWeight(4);
    stroke(245, 245, 15, 130);
    for (int i = 0; i < NB_POINTS; i++)
    {
      PVector p = ((MyPoint)myPoints.get(i)).pos;
      point(p.x, p.y);
    }
  }
}

void mouseClicked()
{
  reset();
}

void keyPressed()
{
  switch(key)
  {
  case 'p':
    displayPoints = !displayPoints;
    break;
  case 'l':
    displayLines = !displayLines;
    break;
  case 'f':
    fillUp = !fillUp;
    break;
  }
}

class MyPoint
{
  final static float MAX_DIST_MOUSE = 60;//mouse influence zone
  final static float MAX_DIST_POINTS = 45;//other points influence zone
  final static float FRICTION_AIR = .9;//'air' FRICTION_AIR
  final static float FRICTION_POINTS = .35;
  PVector target;//original position, MyPoint always tries to get back to it
  int rank, countExclude;
  PVector speed, exclusion, pos, mouseAction;

  MyPoint(PVector p_p, int p_rank)
  {
    pos = p_p.get();
    target = new PVector(pos.x, pos.y, 0);
    speed = new PVector(0, 0, 0);
    exclusion = new PVector(0, 0, 0);
    mouseAction = new PVector(0, 0, 0);
    rank = p_rank;
  }

  public void process()
  {
    float d = PVector.dist(PMouse, pos);//distance to the mouse
    if (d < MAX_DIST_MOUSE)
    {
      float f = .13 * (d - MAX_DIST_MOUSE) / (d);//force
      mouseAction = PVector.sub(PMouse, pos);
      mouseAction.mult(f);
    }
    //check interaction with other points
    MyPoint tmpPoint;
    PVector diff = new PVector(0, 0, 0);
    for (int i = rank+1; i < NB_POINTS; i++)
    {
      tmpPoint = myPoints.get(i);
      d = tmpPoint.pos.dist(pos);
      if (d < MAX_DIST_POINTS && d > 0)
      {
        diff = PVector.sub(pos, tmpPoint.pos);          
        diff.normalize();
        diff.mult(MAX_DIST_POINTS - d);
        exclusion.add(diff);
        countExclude ++;

        diff.mult(-1);
        tmpPoint.exclusion.add(diff);
        tmpPoint.countExclude ++;
      }
    }
    if (countExclude > 0)
    {
      exclusion.div(countExclude);
      exclusion.mult(FRICTION_POINTS);
    }
  }

  public void update()
  {
    exclusion.add(mouseAction);
    speed.add(exclusion);
    speed.mult(FRICTION_AIR);
    pos.add(speed);

    if (pos.x < 0 || pos.x > width)
    { 
      pos.x = constrain(pos.x, 0, width);
      speed.x *= -1.1;//points should not be stuck on the edges
    }
    if (pos.y < 0 || pos.y > height)
    { 
      pos.y = constrain(pos.y, 0, height);
      speed.y *= -1.1;//points should not be stuck on the edges
    }

    //reset all interaction variables before next loop
    exclusion.set(0, 0, 0);
    mouseAction.set(0, 0, 0);
    countExclude = 0;
  }
}

/*
  A custom refactoring of Triangulate library by Florian Jennet, already customed by Ale :-)
  Mainly, the sortX methods were added to be able to run in JS
 */

/*
    CircumCircle
 Calculates if a point (xp,yp) is inside the circumcircle made up of the points (x1,y1), (x2,y2), (x3,y3)
 The circumcircle centre is returned in (xc,yc) and the radius r. A point on the edge is inside the circumcircle
 */

public static class CircumCircle
{
  public static boolean circumCircle(PVector p, Triangle t, PVector circle)
  {
    float m1, m2, mx1, mx2, my1, my2, dx, dy, rsqr, drsqr;

    /* Check for coincident points */
    if (abs(t.p1.y-t.p2.y) < EPSILON && abs(t.p2.y-t.p3.y) < EPSILON) {
      //println("CircumCircle: Points are coincident.");
      return false;
    }

    if (abs(t.p2.y-t.p1.y) < EPSILON) {
      m2 = - (t.p3.x-t.p2.x) / (t.p3.y-t.p2.y);
      mx2 = (t.p2.x + t.p3.x) * .5;
      my2 = (t.p2.y + t.p3.y) * .5;
      circle.x = (t.p2.x + t.p1.x) * .5;
      circle.y = m2 * (circle.x - mx2) + my2;
    } else if (abs(t.p3.y-t.p2.y) < EPSILON) {
      m1 = - (t.p2.x-t.p1.x) / (t.p2.y-t.p1.y);
      mx1 = (t.p1.x + t.p2.x) * .5;
      my1 = (t.p1.y + t.p2.y) * .5;
      circle.x = (t.p3.x + t.p2.x) *.5;
      circle.y = m1 * (circle.x - mx1) + my1;
    } else {
      m1 = - (t.p2.x-t.p1.x) / (t.p2.y-t.p1.y);
      m2 = - (t.p3.x-t.p2.x) / (t.p3.y-t.p2.y);
      mx1 = (t.p1.x + t.p2.x) * .5;
      mx2 = (t.p2.x + t.p3.x) * .5;
      my1 = (t.p1.y + t.p2.y) * .5;
      my2 = (t.p2.y + t.p3.y) * .5;
      circle.x = (m1 * mx1 - m2 * mx2 + my2 - my1) / (m1 - m2);
      circle.y = m1 * (circle.x - mx1) + my1;
    }

    dx = t.p2.x - circle.x;
    dy = t.p2.y - circle.y;
    rsqr = dx*dx + dy*dy;
    circle.z = sqrt(rsqr);

    dx = p.x - circle.x;
    dy = p.y - circle.y;
    drsqr = dx*dx + dy*dy;

    return drsqr <= rsqr;
  }
}

//Calculates the intersection point between two line segments
//Port of Paul Bourke's C implementation of a basic algebra method

static class LineIntersector {

  //Epsilon value to perform accurate floating-point arithmetics
  static final float e = 1e-5;

  //Check intersection and calculates intersection point, storing it in a reference passed to the method
  static boolean intersect (float a_x1, float a_y1, float a_x2, float a_y2, 
  float b_x1, float b_y1, float b_x2, float b_y2, 
  PVector p)
  {
    //Check if lines are parallel
    float d  = ( (b_y2 - b_y1) * (a_x2 - a_x1) ) - ( (b_x2 - b_x1) * (a_y2 - a_y1) );
    if ( abs(d)<e ) return false;   

    //Check if lines intersect
    float na, nb, ma, mb;
    na = ( (b_x2 - b_x1) * (a_y1 - b_y1) ) - ( (b_y2 - b_y1) * (a_x1 - b_x1) );
    nb = ( (a_x2 - a_x1) * (a_y1 - b_y1) ) - ( (a_y2 - a_y1) * (a_x1 - b_x1) );
    ma = na/d;
    mb = nb/d;
    if ( ma<0 || ma>1 || mb<0 || mb>1) return false;
    p.x = a_x1 + ( ma * (a_x2 - a_x1));
    p.y = a_y1 + ( ma * (a_y2 - a_y1));
    return true;
  }

  //We know both lines intersect, so don't check anything, only calculate the intersection point
  static PVector simpleIntersect (float a_x1, float a_y1, float a_x2, float a_y2, 
  float b_x1, float b_y1, float b_x2, float b_y2)
  {
    float
      na = ( (b_x2 - b_x1) * (a_y1 - b_y1) ) - ( (b_y2 - b_y1) * (a_x1 - b_x1) ), 
    d  = ( (b_y2 - b_y1) * (a_x2 - a_x1) ) - ( (b_x2 - b_x1) * (a_y2 - a_y1) ), 
    ma = na/d;
    return new PVector (a_x1 + ( ma * (a_x2 - a_x1)), a_y1 + ( ma * (a_y2 - a_y1)));
  }
}


class Triangle
{
  PVector p1, p2, p3;

  Triangle() { 
    p1 = p2 = p3 = null;
  }

  Triangle(PVector p1, PVector p2, PVector p3) {
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
  }

  Triangle(float x1, float y1, float x2, float y2, float x3, float y3)
  {
    p1 = new PVector(x1, y1);
    p2 = new PVector(x2, y2);
    p3 = new PVector(x3, y3);
  }

  PVector center() {
    return LineIntersector.simpleIntersect(p1.x, p1.y, (p2.x + p3.x)*.5, (p2.y + p3.y)*.5, p2.x, p2.y, (p3.x + p1.x)*.5, (p3.y + p1.y)*.5);
  }
}


/*
 *  ported from p bourke's triangulate.c
 *  http://astronomy.swin.edu.au/~pbourke/modelling/triangulate/
 *  fjenett, 20th february 2005, offenbach-germany.
 *  contact: http://www.florianjenett.de/
 */

class Triangulator
{

  class Edge
  {
    PVector p1, p2;


    Edge() { 
      p1 = p2 = null;
    }

    Edge(PVector p1, PVector p2)
    {
      this.p1 = p1;
      this.p2 = p2;
    }
  }

  boolean sharedVertex(Triangle t1, Triangle t2) {
    return t1.p1 == t2.p2 || t1.p1 == t2.p2 || t1.p1 == t2.p3 ||
      t1.p2 == t2.p1 || t1.p2 == t2.p2 || t1.p2 == t2.p3 ||
      t1.p3 == t2.p1 || t1.p3 == t2.p2 || t1.p3 == t2.p3;
  }

  void sortXList(ArrayList<PVector> ps)
  {
    int l = ps.size();
    PVector p1, p2, pi;
    int r;
    for (int i = 0; i < l-1; i ++)
    {
      pi = ps.get(i);
      p1 = pi.get();
      p2 = pi.get();
      r = i;
      for (int j = i+1; j < l; j++)
      {
        p1 = ps.get(j);        
        if (p1.x < p2.x)
        {
          p2 = p1.get();
          r = j;
        }
      }        
      if (r != i)
      {
        PVector tmpv = ps.get(r);
        ps.set(r, ps.get(i));
        ps.set(i, tmpv);
      }
    }
  }

  void sortXArray(PVector[] ps)
  {
    int l = ps.length;
    PVector p1, p2, pi;
    int r;
    for (int i = 0; i < l-1; i ++)
    {
      pi = ps[i];
      p1 = pi.get();
      p2 = pi.get();
      r = i;
      for (int j = i+1; j < l; j++)
      {
        p1 = ps[j];
        if (p1.x < p2.x)
        {
          p2 = p1.get();
          r = j;
        }
      }
      if (r != i)
      {
        ps[r] = pi;
        ps[i] = p2;
      }
    }
  }

  /*
      Triangulation subroutine
   Takes as input vertices (PVectors) in ArrayList pxyz
   Returned is a list of triangular faces in the ArrayList triangles
   These triangles are arranged in a consistent clockwise order.
   */
  void triangulate(ArrayList<PVector> pxyz, ArrayList<Triangle> triangles)
  {
    // sort vertex array in increasing x values
    sortXList(pxyz);

    // Find the maximum and minimum vertex bounds. This is to allow calculation of the bounding triangle
    float
      xmin = pxyz.get(0).x, 
    ymin = pxyz.get(0).y, 
    xmax = xmin, 
    ymax = ymin;

    for (PVector p : pxyz) {
      if (p.x < xmin) xmin = p.x;
      else if (p.x > xmax) xmax = p.x;
      if (p.y < ymin) ymin = p.y;
      else if (p.y > ymax) ymax = p.y;
    }

    float
      dx = xmax - xmin, 
    dy = ymax - ymin, 
    dmax = dx > dy ? dx : dy, 
    two_dmax = dmax*2, 
    xmid = (xmax+xmin) * .5, 
    ymid = (ymax+ymin) * .5;

    ArrayList<Triangle> complete = new ArrayList<Triangle>(); // for complete Triangles

    /*
        Set up the supertriangle
     This is a triangle which encompasses all the sample points.
     The supertriangle coordinates are added to the end of the
     vertex list. The supertriangle is the first triangle in
     the triangle list.
     */
    Triangle superTriangle = new Triangle(xmid-two_dmax, ymid-dmax, xmid, ymid+two_dmax, xmid+two_dmax, ymid-dmax);
    triangles.add(superTriangle);

    //Include each point one at a time into the existing mesh
    ArrayList<Edge> edges = new ArrayList<Edge>();
    int ts;
    PVector circle;
    boolean inside;

    for (PVector p : pxyz) {
      edges.clear();

      //Set up the edge buffer. If the point (xp,yp) lies inside the circumcircle then the three edges of that triangle are added to the edge buffer and that triangle is removed.
      circle = new PVector();       

      for (int j = triangles.size ()-1; j >= 0; j--)
      {    
        Triangle t = triangles.get(j);
        if (complete.contains(t)) continue;

        inside = CircumCircle.circumCircle(p, t, circle);

        if (circle.x+circle.z < p.x) complete.add(t);
        if (inside)
        {
          edges.add(new Edge(t.p1, t.p2));
          edges.add(new Edge(t.p2, t.p3));
          edges.add(new Edge(t.p3, t.p1));
          triangles.remove(j);
        }
      }

      // Tag multiple edges. Note: if all triangles are specified anticlockwise then all interior edges are opposite pointing in direction.
      int eL = edges.size()-1, eL_= edges.size();
      Edge e1 = new Edge(), e2 = new Edge();

      for (int j=0; j<eL; e1= edges.get (j++)) for (int k=j+1; k<eL_; e2 = edges.get (k++))
        if (e1.p1 == e2.p2 && e1.p2 == e2.p1) e1.p1 = e1.p2 = e2.p1 = e2.p2 = null;

      //Form new triangles for the current point. Skipping over any tagged edges. All edges are arranged in clockwise order.
      for (Edge e : edges) {
        if (e.p1 == null || e.p2 == null) continue;
        triangles.add(new Triangle(e.p1, e.p2, p));
      }
    }

    //Remove triangles with supertriangle vertices
    for (int i = triangles.size ()-1; i >= 0; i--) if (sharedVertex(triangles.get(i), superTriangle)) triangles.remove(i);
  }

  /*
      Triangulation subroutine
   Takes as input vertices (PVectors) in ArrayList pxyz
   Returned is a list of triangular faces in the ArrayList triangles
   These triangles are arranged in a consistent clockwise order.
   */
  ArrayList<Triangle> triangulate(PVector[] vertices)
  {
    int len = vertices.length;

    // sort vertex array in increasing x values
    sortXArray(vertices);

    // Find the maximum and minimum vertex bounds. This is to allow calculation of the bounding triangle
    float
      xmin = vertices[0].x, 
    ymin = vertices[0].y, 
    xmax = xmin, 
    ymax = ymin;

    for (int i=0; i<len; i++) {
      if      (vertices[i].x < xmin) xmin = vertices[i].x;
      else if (vertices[i].x > xmax) xmax = vertices[i].x;
      if      (vertices[i].y < ymin) ymin = vertices[i].y;
      else if (vertices[i].y > ymax) ymax = vertices[i].y;
    }

    float
      dx = xmax - xmin, 
    dy = ymax - ymin, 
    dmax = dx > dy ? dx : dy, 
    two_dmax = dmax*2, 
    xmid = (xmax+xmin) * .5, 
    ymid = (ymax+ymin) * .5;

    ArrayList<Triangle> triangles = new ArrayList<Triangle>(); // for the Triangles
    ArrayList<Triangle> complete = new ArrayList<Triangle>(); // for complete Triangles

    /*
        Set up the supertriangle
     This is a triangle which encompasses all the sample points.
     The supertriangle coordinates are added to the end of the
     vertex list. The supertriangle is the first triangle in
     the triangle list.
     */
    Triangle superTriangle = new Triangle(xmid-two_dmax, ymid-dmax, xmid, ymid+two_dmax, xmid+two_dmax, ymid-dmax);
    triangles.add(superTriangle);

    //Include each point one at a time into the existing mesh
    ArrayList<Edge> edges = new ArrayList<Edge>();
    int ts;
    PVector circle;
    boolean inside;

    for (int v=0; v<len; v++) {
      edges.clear();

      //Set up the edge buffer. If the point (xp,yp) lies inside the circumcircle then the three edges of that triangle are added to the edge buffer and that triangle is removed.
      circle = new PVector();       

      for (int j = triangles.size ()-1; j >= 0; j--)
      {    
        Triangle t = triangles.get(j);
        if (complete.contains(t)) continue;

        inside = CircumCircle.circumCircle(vertices[v], t, circle);

        if (circle.x+circle.z < vertices[v].x) complete.add(t);
        if (inside)
        {
          edges.add(new Edge(t.p1, t.p2));
          edges.add(new Edge(t.p2, t.p3));
          edges.add(new Edge(t.p3, t.p1));
          triangles.remove(j);
        }
      }

      // Tag multiple edges. Note: if all triangles are specified anticlockwise then all interior edges are opposite pointing in direction.
      int eL = edges.size()-1, eL_= edges.size();
      Edge e1 = new Edge(), e2 = new Edge();

      for (int j=0; j<eL; e1= edges.get (j++)) for (int k=j+1; k<eL_; e2 = edges.get (k++))
        if (e1.p1 == e2.p2 && e1.p2 == e2.p1) e1.p1 = e1.p2 = e2.p1 = e2.p2 = null;

      //Form new triangles for the current point. Skipping over any tagged edges. All edges are arranged in clockwise order.
      for (Edge e : edges) {
        if (e.p1 == null || e.p2 == null) continue;
        triangles.add(new Triangle(e.p1, e.p2, vertices[v]));
      }
    }

    //Remove triangles with supertriangle vertices
    for (int i = triangles.size ()-1; i >= 0; i--) if (sharedVertex(triangles.get(i), superTriangle)) triangles.remove(i);

    return triangles;
  }
}



