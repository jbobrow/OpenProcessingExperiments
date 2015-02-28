

int radius = 140;

int unit = radius / 8;

// unused at the moment.
PVector[] figurePoints;

int stageSize = 640;

int pointSize = 2;

void setup()
{
  size(640, 640);
  background(0xFFFFFF);
  noFill();
  noLoop();
  smooth();
  ellipseMode(RADIUS);
  
  // RotateGrid 270deg;    
  pushMatrix();
  translate(-160, 650);
  rotate(radians(270));

  // Construct central figure...
  PVector[] pts = constructDrawing(new PVector(640/2, 960/2), color(0,20), color(#5990e0));
  
  // Construct satellite figures 
  for(int i=0; i<6; i++)
    constructDrawing(pts[i], color(0,10), color(0x555990e0));
        
  popMatrix();
}

void draw()
{
  // no continuous drawing at the moment...
  // a later version will include some interactive parameters.
}

PVector[] constructDrawing(PVector p, color constructionColor, color figureColor)
{
  PVector p1 = p;

  stroke(constructionColor);
  // Define and Draw line sections from central point (p1);
  // pl2 - pl4 at 0, 120, 240 degree stops.
  PVLine pl2 = new PVLine(p1, 0, unit*8); 
  pl2.draw();
  PVLine pl3 = new PVLine(p1, 120, unit*8); 
  pl3.draw();
  PVLine pl4 = new PVLine(p1, 240, unit*8); 
  pl4.draw();

  // pl5 - pl7 at alternate stops 60, 180, 300.
  PVLine pl5 = new PVLine(p1, 60, unit*8); 
  pl5.draw();
  PVLine pl6 = new PVLine(p1, 180, unit*8); 
  pl6.draw();
  PVLine pl7 = new PVLine(p1, 300, unit*8); 
  pl7.draw();
  
  PVector[] gridStops = new PVector[6];
  for(int i=0; i < 6; i++)
  {
    gridStops[i] = new PVLine(p1, i*60, unit*9).p2;
  }

  // Draw construction circles for pl2 - pl4
  Circle c1 = new Circle(pl2.p2, unit*5);
  Circle c1a = new Circle(pl2.p2, unit);  
  c1.draw();
  c1a.draw();

  Circle c2 = new Circle(pl3.p2, unit*5); 
  Circle c2a = new Circle(pl3.p2, unit); 
  c2.draw();
  c2a.draw();

  Circle c3 = new Circle(pl4.p2, unit*5);
  Circle c3a = new Circle(pl4.p2, unit);
  c3.draw();
  c3a.draw();

  // Make construction circles along hexagonal edges.

  /// 1.0
  PVLine pl8 = new PVLine(pl2.p2, pl7.p2);

  PVector[] in1 = c1.lineIntersect(pl8);  
  Circle c6 = new Circle(in1[0], unit*2);
  c6.draw();

  PVector[] in2 = c6.lineIntersect(pl8);
  Circle c7 = new Circle(in2[1], unit*2);
  c7.draw();

  PVector[] in3 = c7.lineIntersect(pl8);
  Circle c8 = new Circle(in3[1], unit*2);
  c8.draw();

  PVector[] cIn1 = c6.circleIntersect(c7);
  Circle cIn1_c = new Circle(cIn1[0], pointSize);
  cIn1_c.draw();

  PVector[] cIn2 = c7.circleIntersect(c8);
  Circle cIn2_c = new Circle(cIn2[0], pointSize);
  cIn2_c.draw();

  /// 1.1
  PVLine pl9 = new PVLine(pl2.p2, pl5.p2);

  PVector[] in4 = c1.lineIntersect(pl9);  
  Circle c9 = new Circle(in4[0], unit*2);
  c9.draw();

  PVector[] in5 = c9.lineIntersect(pl9);
  Circle c10 = new Circle(in5[1], unit*2);
  c10.draw();

  PVector[] in6 = c10.lineIntersect(pl9);
  Circle c11 = new Circle(in6[1], unit*2);
  c11.draw();

  PVector[] cIn3 = c9.circleIntersect(c10);
  Circle cIn3_c = new Circle(cIn3[1], pointSize);
  cIn3_c.draw();

  PVector[] cIn4 = c10.circleIntersect(c11);
  Circle cIn4_c = new Circle(cIn4[1], pointSize);
  cIn4_c.draw();

  /// 2.0
  PVLine pl10 = new PVLine(pl3.p2, pl5.p2);

  PVector[] in7 = c2.lineIntersect(pl10);  
  Circle c12 = new Circle(in7[0], unit*2);
  c12.draw();

  PVector[] in8 = c12.lineIntersect(pl10);
  Circle c13 = new Circle(in8[1], unit*2);
  c13.draw();

  PVector[] in9 = c13.lineIntersect(pl10);
  Circle c14 = new Circle(in9[1], unit*2);
  c14.draw();

  PVector[] cIn5 = c12.circleIntersect(c13);
  Circle cIn5_c = new Circle(cIn5[0], pointSize);
  cIn5_c.draw();

  PVector[] cIn6 = c13.circleIntersect(c14);
  Circle cIn6_c = new Circle(cIn6[0], pointSize);
  cIn6_c.draw();

  /// 2.1
  PVLine pl11 = new PVLine(pl3.p2, pl6.p2);

  PVector[] in10 = c2.lineIntersect(pl11);  
  Circle c15 = new Circle(in10[0], unit*2);
  c15.draw();

  PVector[] in11 = c15.lineIntersect(pl11);
  Circle c16 = new Circle(in11[1], unit*2);
  c16.draw();

  PVector[] in12 = c16.lineIntersect(pl11);
  Circle c17 = new Circle(in12[1], unit*2);
  c17.draw(); 

  PVector[] cIn7 = c15.circleIntersect(c16);
  Circle cIn7_c = new Circle(cIn7[1], pointSize);
  cIn7_c.draw();

  PVector[] cIn8 = c16.circleIntersect(c17);
  Circle cIn8_c = new Circle(cIn8[1], pointSize);
  cIn8_c.draw();

  /// 3.0
  PVLine pl12 = new PVLine(pl7.p2, pl4.p2);

  PVector[] in13 = c3.lineIntersect(pl12);  
  Circle c18 = new Circle(in13[1], unit*2);
  c18.draw();

  PVector[] in14 = c18.lineIntersect(pl12);
  Circle c19 = new Circle(in14[0], unit*2);
  c19.draw();

  PVector[] in15 = c19.lineIntersect(pl12);
  Circle c20 = new Circle(in15[0], unit*2);
  c20.draw();

  PVector[] cIn9 = c18.circleIntersect(c19);
  Circle cIn9_c = new Circle(cIn9[1], pointSize);
  cIn9_c.draw();

  PVector[] cIn10 = c19.circleIntersect(c20);
  Circle cIn10_c = new Circle(cIn10[1], pointSize);
  cIn10_c.draw();

  /// 3.1
  PVLine pl13 = new PVLine(pl6.p2, pl4.p2);

  PVector[] in16 = c3.lineIntersect(pl13);  
  Circle c21 = new Circle(in16[1], unit*2);
  c21.draw();

  PVector[] in17 = c21.lineIntersect(pl13);
  Circle c22 = new Circle(in17[0], unit*2);
  c22.draw();

  PVector[] in18 = c22.lineIntersect(pl13);
  Circle c23 = new Circle(in18[0], unit*2);
  c23.draw();

  PVector[] cIn11 = c21.circleIntersect(c22);
  Circle cIn11_c = new Circle(cIn11[0], pointSize);
  cIn11_c.draw();

  PVector[] cIn12 = c22.circleIntersect(c23);
  Circle cIn12_c = new Circle(cIn12[0], pointSize);
  cIn12_c.draw();

  // Draw construction circle for interior corners.
  Circle c4 = new Circle(p1, unit); 
  c4.draw();

  // points for interior corners.
  PVector[] in19 = c4.lineIntersect(pl5);
  Circle c25 = new Circle(in19[0], pointSize); 
  c25.draw();

  PVector[] in20 = c4.lineIntersect(pl6);
  Circle c26 = new Circle(in20[0], pointSize);
  c26.draw();

  PVector[] in21 = c4.lineIntersect(pl7);
  Circle c27 = new Circle(in21[0], pointSize);
  c27.draw();

  // Draw construction circle for exterior corners.
  Circle c5 = new Circle(p1, unit*3);
  c5.draw();

  // points for exterior corners.
  PVector[] in22 = c5.lineIntersect(pl5);
  Circle c28 = new Circle(in22[0], pointSize);
  c28.draw();

  PVector[] in23 = c5.lineIntersect(pl6);
  Circle c29 = new Circle(in23[0], pointSize);
  c29.draw();

  PVector[] in24 = c5.lineIntersect(pl7);
  Circle c30 = new Circle(in24[0], pointSize);
  c30.draw();

  // Draw hexagon.
  polygon(6, p1.x, p1.y, unit*8*2, unit*8*2, 0);

  ///// Draw figure. 1/3
  stroke(figureColor);
  drawFigure(c27, cIn2_c, cIn1_c, c30, cIn9_c, cIn10_c);
  
  drawFigure(c29, cIn11_c, cIn12_c, c26, cIn8_c, cIn7_c);
  
  drawFigure(c28, cIn5_c, cIn6_c, c25, cIn4_c, cIn3_c);
  
  return gridStops;
}

void drawFigure(Circle a, Circle b, Circle c, Circle d, Circle e, Circle f) {
  beginShape();
  vertex(a.centre.x, a.centre.y);
  vertex(b.centre.x, b.centre.y);
  vertex(c.centre.x, c.centre.y);
  vertex(d.centre.x, d.centre.y);
  vertex(e.centre.x, e.centre.y);
  vertex(f.centre.x, f.centre.y);
  endShape(CLOSE);
}

void polygon(int n, float cx, float cy, float w, float h, float startAngle)
{
  float angle = TWO_PI/ n;

  w = w / 2.0;
  h = h / 2.0;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + w * cos(startAngle + angle * i), 
    cy + h * sin(startAngle + angle * i));
  }
  endShape(CLOSE);
}

class Circle {
  public PVector centre = new PVector();
  public float r;

  public Circle() {
  }

  public Circle(PVector _c, float _r)
  {
    centre = _c;
    r = _r;
  }  

  public Circle(int _x, int _y, float _r)
  {
    centre.x = (float)_x;
    centre.y = (float)_y;
    r = _r;
  }

  public Circle(float _x, float _y, float _r) {
    centre.x = _x;
    centre.y = _y;
    r = _r;
  }  

  public void draw()
  {  
    ellipseMode(RADIUS);
    ellipse(centre.x, centre.y, r, r);
  }

  PVector[] circleIntersect(Circle c2)
  {
    // Calculate distance between centres of circle
    float d = PVector.dist(c2.centre, centre);

    float m = r + c2.r;
    float n = r - c2.r;

    if (n < 0)
      n = n * -1;

    //No solns
    if ( d > m )
      return null;

    //Circle are contained within each other
    if ( d < n )
      return null;

    //Circles are the same
    if ( d == 0 && r == c2.r )
      return null;

    //Solve for a
    float a = ( r * r - c2.r * c2.r + d * d ) / (2 * d);

    //Solve for h
    float h = sqrt( r * r - a * a );

    //Calculate point p, where the line through the circle intersection points crosses the line between the circle centers.  
    PVector p = new PVector ( centre.x + ( a / d ) * ( c2.centre.x -centre.x ), centre.y + ( a / d ) * ( c2.centre.y -centre.y ) );

    //1 solution, circles are touching
    if ( d == r + c2.r ) {
      return new PVector[] {
        p
      };
    }

    return new PVector[] {
      new PVector ( p.x + ( h / d ) * ( c2.centre.y - centre.y ), p.y - ( h / d ) * ( c2.centre.x - centre.x ) ), 
      new PVector ( p.x - ( h / d ) * ( c2.centre.y - centre.y ), p.y + ( h / d ) * ( c2.centre.x - centre.x ) )
      };
    }

    PVector[] lineIntersect(PVLine ln) {

      float dx = ln.p2.x - ln.p1.x;
      float dy = ln.p2.y - ln.p1.y;
      float a = dx * dx + dy * dy;
      float b = 2 * (dx * (ln.p1.x - centre.x) + dy * (ln.p1.y - centre.y));
      float c = centre.x * centre.x + centre.y * centre.y;
      c += ln.p1.x * ln.p1.x + ln.p1.y * ln.p1.y;
      c -= 2 * (centre.x * ln.p1.x + centre.y * ln.p1.y);
      c -= r * r;
      float bb4ac = b * b - 4 * a * c;

      if (bb4ac < 0) // no intersection
      {
        return null;
      }
      else 
      {
        float mu = (-b + sqrt( b*b - 4*a*c )) / (2*a);
        float ix1 = ln.p1.x + mu*(dx);
        float iy1 = ln.p1.y + mu*(dy);
        mu = (-b - sqrt(b*b - 4*a*c )) / (2*a);
        float ix2 = ln.p1.x + mu*(dx);
        float iy2 = ln.p1.y + mu*(dy);

        PVector ip1 = new PVector(ix1, iy1);
        PVector ip2 = new PVector(ix2, iy2);

        // Figure out which point is closer to the circle
        PVector test;
        test = (PVector.dist(ln.p1, centre) < PVector.dist(ln.p2, centre)) ?  ln.p2 : ln.p1;

        if (PVector.dist(test, ip1) < PVector.dist(ln.p1, ln.p2) || PVector.dist(test, ip2) < PVector.dist(ln.p1, ln.p2))
        return new PVector[] {
          ip1, ip2
        };
        else
          return null;
      }
    }
}

class PVLine {

  PVector p1;
  PVector p2;

  PVLine(PVector _p1, PVector _p2) 
  {
    p1 = _p1;
    p2 = _p2;
  }

  PVLine(PVector _p1, float a, float l)
  {
    p1 = _p1;
    to(a, l);
  }

  void to(float a, float l)
  {
    p2 = new PVector( p1.x+cos(radians(a))*l, p1.y-sin(radians(a))*l );
  }

  void draw()
  {
    line(p1.x, p1.y, p2.x, p2.y);
  }
}


