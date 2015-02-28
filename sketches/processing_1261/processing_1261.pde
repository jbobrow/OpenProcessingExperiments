
// do some stuff

// Convert pattern to stars, using something like the Hankin method.
// To do: add line separation...

Vector  polys;

boolean isInteractive = false; // turn off when you've found a good ratio for this tiling...

float minx=10000, maxx=-10000, miny=10000, maxy=-10000;
float dxs = 1;
float dys = 1;
float lm = 10;
float tm = 10;
float ratio = 1;
float angStar = (2*PI)/18;  // 30 degrees
float edgeDist = .1;
float starEdge = 1000;

void setup()
{
  size(600,600);
  colorMode(RGB, 1);
  smooth();
  strokeWeight(2);
  //   noLoop();
  polys = new Vector();
  ReadFile("altair1.txt");
}

void draw()
{

  angStar = .001 + (float) mouseX/width*PI;
  edgeDist = (float) mouseY/height;
  // println("angstar = " + angStar  + " lm = " + lm);
//    println("ratio = " + ratio);
//  }
  background(.5);
  for (int i = 0; i < polys.size(); ++i) {
    Poly poly = (Poly) polys.elementAt(i);
    poly.doDraw();
  }
}

void ReadFile(String vFileName)
{
  Vector vipts = new Vector();
  String lines[] = loadStrings(vFileName);
  for (int i = 0; i < lines.length; ++i) {
      if (lines[i].length() < 3)
        continue;
      String nums[] = lines[i].split(",");
      for (int j = 0; j < nums.length; ++j) {
        if (nums[j].substring(0,1).equals(" "))
          nums[j] = nums[j].substring(1);
        if (nums[j].length() > 0)
          vipts.addElement(new Float(float(nums[j])));
      }
    }
    polys = new Vector();
    float[] ipts;
    ipts = new float[vipts.size()];
    println("loaded " + vipts.size() + " points");
    for (int i = 0; i < vipts.size(); ++i) {
      ipts[i] = ((Float) vipts.elementAt(i)).floatValue();
    }

    for (int i = 0; i < vipts.size(); ) 
    {
      int nbrSides = (int) ipts[i++];
      Poly poly = new Poly(nbrSides);
      for (int j = 0; j < nbrSides; ++j) {
        poly.AddDot(ipts[i+j*2],ipts[i+j*2+1]);
      }
      i += nbrSides*2;
      polys.addElement(poly);
    }
    println("loaded " + polys.size() + " polys");
    dxs = (width-lm*2)/(float)(maxx-minx);
    dys = (height-tm*2)/(float)(maxy-miny);    

}


class Point
{
  float x,y;
  Point(float x, float y)
  {
    this.x = x;
    this.y = y;
    if (x < minx)  minx = x;
    if (x > maxx)  maxx = x;
    if (y < miny)  miny = y;
    if (y > maxy)  maxy = y;
  }  
}

// this crashes in certain situations...
Point intersection(float x1,float y1,float x2,float y2, 
   float x3, float y3, float x4,float y4 ) 
   {
    float d = (x1-x2)*(y3-y4) - (y1-y2)*(x3-x4);
    try {
//      float xi = ((x3-x4)*(x1*y2-y1*x2)-(x1-x2)*(x3*y4-y3*x4))/d;
//      float yi = ((y3-y4)*(x1*y2-y1*x2)-(y1-y2)*(x3*y4-y3*x4))/d;
      float denom = (y4-y3)*(x2-x1) - (x4-x3)*(y2-y1);
      float numea = (x4-x3)*(y1-y3) - (y4-y3)*(x1-x3);
      float numeb = (x2-x1)*(y1-y3) - (y2-y1)*(x1-x3);
      if (abs(denom) < 0.01) {
        if (numea == 0.0 && numeb == 0.0)
        {
            // coincident
            println("c");
            return new Point ( x1, y1 );
        }
        else {
            // parallel
            println("p");
            return null;
        }
      }
      float ua = numea / denom;
      float ub = numeb / denom;
      if (ua >= 0.0f && ua <= 1.0f && ub >= 0.0f && ub <= 1.0f)
      {
        float xi = x1 + ua*(x2-x1);
        float yi = y1 + ua*(y2-y1);
        if (xi > 0 && xi < width && yi > 0 && yi < width)
          return new Point(xi,yi);
        else
          return null;
      }
      else {
        // not intersecting - this works well...
        return new Point (x1, y1 );
      }
    }
    catch (Exception e)
    {
      println("e");
      return null;
    }  
}

class Poly
{
  Vector  pts;
  int nbrSides;
  
  Poly(int nbrSides)
  {
    this.nbrSides = nbrSides;
    this.pts = new Vector();
  }
  
  void AddDot(float x, float y)
  {
    pts.add( new Point(x,y) );
  }
  
  void doDraw()
  {
    if (outsideBorder())
    {
      fill(.5);
      return;
    }
    else
      fill(1);
    
    float r = sin(nbrSides*PI*2/8.0);
    float g = sin(nbrSides*PI*2/8.0+2);
    float b = sin(nbrSides*PI*2/8.0+4);
    fill  (.9+r*.1, .9+g*.1, .9+b*.1);
    stroke(.8+r*.1, .8+g*.1, .8+b*.1);

    String outStr = nbrSides +",";
    beginShape();
    
    for (int i = 0; i <= nbrSides; ++i) {
      Point pt = (Point) pts.elementAt(i % nbrSides);
      vertex( tx(pt.x), ty(pt.y) );
      if (i < nbrSides)
        outStr += pt.x + "," + pt.y + ",";
    }
    endShape();
    // println(outStr);

    stroke(0);

    float cx = 0;
    float cy = 0;
    for (int i = 0; i < nbrSides; ++i) {
      Point pt = (Point) pts.elementAt(i % nbrSides);
      cx += tx(pt.x);
      cy += ty(pt.y);
    }
    cx /= nbrSides;
    cy /= nbrSides;
    for (int i = 0; i < nbrSides; ++i) {
       Point p1 = (Point) pts.elementAt(i % nbrSides);
       Point p2 = (Point) pts.elementAt((i+1) % nbrSides);
       Point p3 = (Point) pts.elementAt((i+2) % nbrSides);
       // Draw segment that starts at midpoint of p2,p1 and goes at angle p2,p1 + (PI-angStar)/2
       // to the point where it intersects segment that starts at midpoint of p2,p3 and goes at angle p2,p3-(PI-angStar)/2
       float mx1 = (p1.x + p2.x)/2;
       float my1 = (p1.y + p2.y)/2;
       mx1 += (p1.x - p2.x)*edgeDist;
       my1 += (p1.y - p2.y)*edgeDist;
       float mx2 = (p3.x + p2.x)/2;
       float my2 = (p3.y + p2.y)/2;
       mx2 += (p3.x - p2.x)*edgeDist;
       my2 += (p3.y - p2.y)*edgeDist;
       float ang1 = atan2(p2.y-p1.y,p2.x-p1.x) + (PI-angStar)/2;
       float ang2 = atan2(p2.y-p3.y,p2.x-p3.x) - (PI-angStar)/2;
       float ex1 = mx1+cos(ang1)*starEdge;
       float ey1 = my1+sin(ang1)*starEdge;
       float ex2 = mx2+cos(ang2)*starEdge;
       float ey2 = my2+sin(ang2)*starEdge;
       Point ip = intersection(mx1,my1,ex1,ey1,mx2,my2,ex2,ey2);
       if (ip == null)
         continue;
       line(tx(mx1),ty(my1), tx(ip.x), ty(ip.y));
       line(tx(mx2),ty(my2), tx(ip.x), ty(ip.y));
       // Find point where these lines intersect, and draw line from mx1,my1 ix,iy   and mx2,my2,ix,iy
    }
  }

  boolean outsideBorder()
  {
    float cx = 0;
    float cy = 0;
    for (int i = 0; i < nbrSides; ++i) {
      Point pt = (Point) pts.elementAt(i % nbrSides);
      cx += tx(pt.x);
      cy += ty(pt.y);
    }
    cx /= nbrSides;
    cy /= nbrSides;
    float dx = cx - width/2;
    float dy = cy - height/2;
    return sqrt(dx*dx + dy*dy) > ratio*width/2 ;
  }
}

float tx(float x)
{
  return (x - minx)*dxs + lm;
}

float ty(float y)
{
  return (y - miny)*dys + tm;
}

void myLine(float x1, float y1, float x2, float y2)
{
  line(tx(x1),ty(y1),tx(x2),ty(y2));
}


