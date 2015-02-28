
int radius = 60;
int unit = radius / 8;

String palette_txt = "00314C,71969F,FAE5A6,B51E1E,731414,Presidential Poster@240A09,730A13,635D47,C09745,FDD978,Japanese Garden@092C45,115585,1A7DC4,1C85D1,176CAA,Blues@BAB293,A39770,EFE4BD,A32500,2B2922,Detroit@BD7938,8D4421,643001,532700,3A1C00,Coffee@4F270E,9C3C00,BD814B,D1B48B,788A83,Confessions of a sinner@2D4A48,567055,9F825A,DE8B45,D05033,Delicious@59756E,709989,87B896,9EC28E,C0D49B,Aquatic Serenity@2F2933,01A2A6,29D9C2,BDF271,FFFFA6,Friends and Foes@131B2E,515B5D,BEBA8A,F2CA50,D92526,Desiderim@CFCA4C,FCF5BF,9FE5C2,5EB299,745A33,Fossil Vintage@302B1D,3F522B,737D26,A99E46,D9CB84,Bonsai Sprouts@468966,FFF0A5,FFB03B,B64926,8E2800,Firenze@E6E2AF,A7A37E,EFECCA,046380,002F2F,Sandy Stone Beach Ocean@282B15,304226,36614D,5AB8AE,AFDBD3,Cold lake@403D33,807966,CCC2A3,8C0000,590000,Nordic Kitchen@0A1F33,AC0000,D9CEAD,99917A,4D4941,Scandinavian Uniform@262626,E65C00,F2F2E6,308FBF,0A1F33,Athletic Bears@292929,5B7876,8F9E8B,F2E6B6,412A22,Dusty Petrol@171717,2E2E2E,0F5A99,299CED,54C7FF,Cool Blue@4C2B11,807960,F2E6B6,75C5E6,3D8CB8,California Catering@131313,4E3621,639930,A3D37A,DFEDD1,Asian Oasis@290A0B,390F0A,6E0904,B3A468,FCA800,American Soil@610002,807960,F2E6B6,3D8CB8,0A1F33,Detroit Retro@00314C,71969F,FAE5A6,B51E1E,731414,Presidential Poster@4D5C5C,324040,202929,1F1E1D,C4801B,JetFlat@FF5621,FFEFBA,5A615F,3F4241,292D2C,Good Morning Sea Wolf";

// unused at the moment.
ArrayList figurePoints = new ArrayList();

PVector[] pts;
PVector[] tpts;

int stageWidth = 640;
int stageHeight = 640;

int tOffsetX = -((stageHeight/2)-(stageWidth/2));
int tOffsetY = stageHeight + tOffsetX;

int matrixRotation = 270;
int pointSize = 2;

PVector original = new PVector(stageWidth/2, stageHeight/2);

int[] colorSet;
int colorIndex = 0;
String paletteFile[];
int[][] colorSets;

// Original blue : 0x555990e0

int bgColor = #FFFFFF;
int constructionStrokeWeight = 1;
int figureStrokeWeight = 1;
int strokeAlpha = 30;
int fillAlpha = 80;
int constructionStrokeAlpha = 10;
int constructionColor = #000000;

int getColorHexString(String s)
{
  return unhex("FF"+s);
}

void setup()
{

  println(tOffsetX);
  println(tOffsetY);

  size(640, 640);

  // use a palette file (see the string and replace all '*' with newlines.
  // paletteFile = loadStrings("palette.txt");
  paletteFile = palette_txt.split("@");

  colorSets = new int[paletteFile.length][5];

  int[] paletteLine;

  for (int i=0; i<paletteFile.length; i++)
  {
    paletteLine = new int[5];
    for (int j=0; j<5; j++)
    {
      paletteLine[j] = getColorHexString(paletteFile[i].split(",")[j]);
    }
    colorSets[i] = paletteLine;
  } 
  colorSet = colorSets[0];

  frameRate(90);
  // noLoop();
  ellipseMode(RADIUS);
  background(bgColor);

  //  radiusTF = new GTextField(this, "", 40, 3, 30, 17);
  //  radiusTFLabel = new GLabel(this, "Radius", 0, 5, 40);

  noFill();
  smooth();

  beginRotate();
  int f = colorSet[(int)Math.floor(Math.random()*colorSet.length)];
  //println(b);

  pts = constructDrawing(original, color(constructionColor, constructionStrokeAlpha), f, f);
  endRotate();

  figurePoints.add(original);
}

void draw()
{

  beginRotate();
  // Construct satellite figures
  for (int i=0; i<6; i++)
  {
    int f = colorSet[(int)Math.floor(Math.random()*colorSet.length)];
    tpts = constructDrawing(pts[i], color(constructionColor, constructionStrokeAlpha), f, f);
  }

  Collections.shuffle(Arrays.asList(tpts));
  pts = tpts;

  endRotate();
  //println(figurePoints);
}

void keyPressed() {

  boolean done = false;

  if ((key == '+' || key == '-') && !done) {
    background(bgColor);
    if (radius > 8 && key == '-') radius --;
    if (radius < 200 && key == '+') radius ++;
    unit = radius / 8;
    println(radius + " : " + unit);
    figurePoints.clear();

    beginRotate();
    int f = colorSet[(int)Math.floor(Math.random()*colorSet.length)];
    pts = constructDrawing(original, color(constructionColor, constructionStrokeAlpha), f, f);
    endRotate();

    figurePoints.add(original);
    done = true;
  }

  if (key == 'o')
  {
    constructionStrokeAlpha++;
    done = true;
  }
  if (key == 'p')
  {
    constructionStrokeAlpha--;
    done = true;
  }

  if (( key == '[' || key == ']') ) {
    if (key == '[')
      colorIndex--;
    else
      colorIndex++;

    colorIndex = (colorIndex < 0) ? colorSets.length -1 : colorIndex;
    colorIndex = (colorIndex > colorSets.length -1) ? 0 : colorIndex;
    colorSet = colorSets[colorIndex];

    background(bgColor);
    figurePoints.clear();
    beginRotate();
    int f = colorSet[(int)Math.floor(Math.random()*colorSet.length)];
    pts = constructDrawing(original, color(constructionColor, constructionStrokeAlpha), f, f);
    endRotate();
    figurePoints.add(original);
    done = true;
  }

  if (key == 'b') 
  { 
    bgColor = #000000;
    constructionColor = #FFFFFF;
    background(bgColor);
    figurePoints.clear();
    beginRotate();
    int f = colorSet[(int)Math.floor(Math.random()*colorSet.length)];
    pts = constructDrawing(original, color(constructionColor, constructionStrokeAlpha), f, f);
    endRotate();
    figurePoints.add(original);
    done = true;
  }

  if (key == 'w')
  {
    bgColor = #FFFFFF;
    constructionColor = #000000;
    background(bgColor);
    figurePoints.clear();
    beginRotate();
    int f = colorSet[(int)Math.floor(Math.random()*colorSet.length)];
    pts = constructDrawing(original, color(constructionColor, constructionStrokeAlpha), f, f);
    endRotate();
    figurePoints.add(original);
    done = true;
  }

  if (key == '0')
  {
    figureStrokeWeight = 0;
    done = true;
  }

  if (key == '1')
  {
    figureStrokeWeight = 1;
    done = true;
  }

  if (key == '2')
  {
    figureStrokeWeight = 2;
    done = true;
  }

  if (key == 'n') 
  {
    fillAlpha --; 
    done = true; 
    fillAlpha = (fillAlpha < 1) ? 1 : fillAlpha;
  }

  if (key == 'm') {
    fillAlpha ++; 
    done = true;
    fillAlpha = (fillAlpha > 254) ? 254 : fillAlpha;
  }

  if (key == ',') {
    strokeAlpha --; 
    strokeAlpha = (strokeAlpha < 1) ? 1 : strokeAlpha;
    done = true;
  }

  if (key == '.') {
    strokeAlpha ++; 
    strokeAlpha = (strokeAlpha > 254) ? 254 : strokeAlpha;
    done = true;
  }
  //if (!done)
  //saveFrame("hex-type5.3_iphone4_####.png");
}

void beginRotate() {
  pushMatrix();
  translate(tOffsetX, tOffsetY);
  rotate(radians(matrixRotation));
}

void endRotate() {
  popMatrix();
}

boolean notDone(PVector p)
{
  if (p == null) return false;

  for (int i=0; i<figurePoints.size(); i++)
  {
    PVector t = (PVector) figurePoints.get(i);
    if ((int)p.x == (int)t.x && (int)p.y == (int)t.y) return false;
  }
  return true;
}


PVector[] constructDrawing(PVector p, color cColor, color figureColor, color figureStrokeColor)
{  

  strokeWeight(constructionStrokeWeight);

  PVector[] gridStops = new PVector[6];

  float distance = PVector.dist(p, original) / 10;
  float fadeAlpha = distance;

  if (p == original)
    fadeAlpha = 0;

  fadeAlpha = clamp(0, 100, fadeAlpha);

  for (int i=0; i < 6; i++)
  {
    gridStops[i] = new PVLine(p, i*60, unit*9).p2;
  }

  if (!notDone(p) || Math.random()*300 > 280 )
    return gridStops;

  PVector p1 = p;

  figurePoints.add(p);

  stroke(cColor);

  // drawGrid();

  // Define and Draw line sections from central point (p1);
  // pl2 - pl4 at 0, 120, 240 degree stops.
  PVLine pl2 = new PVLine(p1, 0, unit*8);
  PVLine pl3 = new PVLine(p1, 120, unit*8);
  PVLine pl4 = new PVLine(p1, 240, unit*8);
  // pl5 - pl7 at alternate stops 60, 180, 300.
  PVLine pl5 = new PVLine(p1, 60, unit*8);
  PVLine pl6 = new PVLine(p1, 180, unit*8);
  PVLine pl7 = new PVLine(p1, 300, unit*8);
  // Draw construction circles for pl2 - pl4
  Circle c1 = new Circle(pl2.p2, unit*5);
  Circle c1a = new Circle(pl2.p2, unit);
  Circle c2 = new Circle(pl3.p2, unit*5);
  Circle c2a = new Circle(pl3.p2, unit);
  Circle c3 = new Circle(pl4.p2, unit*5);
  Circle c3a = new Circle(pl4.p2, unit);

  // Make construction circles along hexagonal edges.
  /// 1.0
  PVLine pl8 = new PVLine(pl2.p2, pl7.p2);
  PVector[] in1 = c1.lineIntersect(pl8);
  Circle c6 = new Circle(in1[0], unit*2);
  PVector[] in2 = c6.lineIntersect(pl8);
  Circle c7 = new Circle(in2[1], unit*2);
  PVector[] in3 = c7.lineIntersect(pl8);
  Circle c8 = new Circle(in3[1], unit*2);
  PVector[] cIn1 = c6.circleIntersect(c7);
  Circle cIn1_c = new Circle(cIn1[0], pointSize);
  PVector[] cIn2 = c7.circleIntersect(c8);
  Circle cIn2_c = new Circle(cIn2[0], pointSize);
  /// 1.1
  PVLine pl9 = new PVLine(pl2.p2, pl5.p2);
  PVector[] in4 = c1.lineIntersect(pl9);
  Circle c9 = new Circle(in4[0], unit*2);
  PVector[] in5 = c9.lineIntersect(pl9);
  Circle c10 = new Circle(in5[1], unit*2);
  PVector[] in6 = c10.lineIntersect(pl9);
  Circle c11 = new Circle(in6[1], unit*2);
  PVector[] cIn3 = c9.circleIntersect(c10);
  Circle cIn3_c = new Circle(cIn3[1], pointSize);
  PVector[] cIn4 = c10.circleIntersect(c11);
  Circle cIn4_c = new Circle(cIn4[1], pointSize);

  /// 2.0
  PVLine pl10 = new PVLine(pl3.p2, pl5.p2);
  PVector[] in7 = c2.lineIntersect(pl10);
  Circle c12 = new Circle(in7[0], unit*2);
  PVector[] in8 = c12.lineIntersect(pl10);
  Circle c13 = new Circle(in8[1], unit*2);
  PVector[] in9 = c13.lineIntersect(pl10);
  Circle c14 = new Circle(in9[1], unit*2);
  PVector[] cIn5 = c12.circleIntersect(c13);
  Circle cIn5_c = new Circle(cIn5[0], pointSize);
  PVector[] cIn6 = c13.circleIntersect(c14);
  Circle cIn6_c = new Circle(cIn6[0], pointSize);

  /// 2.1
  PVLine pl11 = new PVLine(pl3.p2, pl6.p2);
  PVector[] in10 = c2.lineIntersect(pl11);
  Circle c15 = new Circle(in10[0], unit*2);
  PVector[] in11 = c15.lineIntersect(pl11);
  Circle c16 = new Circle(in11[1], unit*2);
  PVector[] in12 = c16.lineIntersect(pl11);
  Circle c17 = new Circle(in12[1], unit*2);
  PVector[] cIn7 = c15.circleIntersect(c16);
  Circle cIn7_c = new Circle(cIn7[1], pointSize);
  PVector[] cIn8 = c16.circleIntersect(c17);
  Circle cIn8_c = new Circle(cIn8[1], pointSize);

  /// 3.0
  PVLine pl12 = new PVLine(pl7.p2, pl4.p2);
  PVector[] in13 = c3.lineIntersect(pl12);
  Circle c18 = new Circle(in13[1], unit*2);
  PVector[] in14 = c18.lineIntersect(pl12);
  Circle c19 = new Circle(in14[0], unit*2);
  PVector[] in15 = c19.lineIntersect(pl12);
  Circle c20 = new Circle(in15[0], unit*2);
  PVector[] cIn9 = c18.circleIntersect(c19);
  Circle cIn9_c = new Circle(cIn9[1], pointSize);
  PVector[] cIn10 = c19.circleIntersect(c20);
  Circle cIn10_c = new Circle(cIn10[1], pointSize);

  /// 3.1
  PVLine pl13 = new PVLine(pl6.p2, pl4.p2);
  PVector[] in16 = c3.lineIntersect(pl13);
  Circle c21 = new Circle(in16[1], unit*2);
  PVector[] in17 = c21.lineIntersect(pl13);
  Circle c22 = new Circle(in17[0], unit*2);
  PVector[] in18 = c22.lineIntersect(pl13);
  Circle c23 = new Circle(in18[0], unit*2);
  PVector[] cIn11 = c21.circleIntersect(c22);
  Circle cIn11_c = new Circle(cIn11[0], pointSize);
  PVector[] cIn12 = c22.circleIntersect(c23);
  Circle cIn12_c = new Circle(cIn12[0], pointSize);

  // Draw construction circle for interior corners.
  Circle c4 = new Circle(p1, unit);
  // points for interior corners.
  PVector[] in19 = c4.lineIntersect(pl5);
  Circle c25 = new Circle(in19[0], pointSize);
  PVector[] in20 = c4.lineIntersect(pl6);
  Circle c26 = new Circle(in20[0], pointSize);
  PVector[] in21 = c4.lineIntersect(pl7);
  Circle c27 = new Circle(in21[0], pointSize);

  // Draw construction circle for exterior corners.
  Circle c5 = new Circle(p1, unit*3);
  // points for exterior corners.
  PVector[] in22 = c5.lineIntersect(pl5);
  Circle c28 = new Circle(in22[0], pointSize);
  PVector[] in23 = c5.lineIntersect(pl6);
  Circle c29 = new Circle(in23[0], pointSize);
  PVector[] in24 = c5.lineIntersect(pl7);
  Circle c30 = new Circle(in24[0], pointSize);

  // Drawing...

  // cross lines
  pl2.draw();
  pl3.draw();
  pl4.draw();
  // alt cross lines
  pl5.draw();
  pl6.draw();
  pl7.draw();

  // 5 unit circles at 120deg corners
  /** /
   c1.draw();
   c2.draw();
   c3.draw();
  /**/
  // 1unit circles at 120deg corners
  /** /
   c1a.draw();
   c2a.draw();
   c3a.draw();
  /**/
  // point finding intersect circles.
  // side 1.0
  c6.draw();
  c7.draw();
  c8.draw();
  // side 1.0 - intersecting points.
  /** /
   cIn1_c.draw();
   cIn2_c.draw();
  /**/
  // side 1.1.
  c9.draw();
  c10.draw();
  c11.draw();
  // side 1.1 - intersecting points.
  /** /
   cIn3_c.draw();
   cIn4_c.draw();
  /**/
  // side 2.0
  c12.draw();
  c13.draw();
  c14.draw();
  // side 2.0 - intersecting points.
  /** /
   cIn5_c.draw();
   cIn6_c.draw();
  /**/
  // side 2.1
  c16.draw();
  c15.draw();
  c17.draw();
  // side 2.1 - intersecting points.
  /** /
   cIn7_c.draw();
   cIn8_c.draw();
  /**/
  // side 3.0
  c18.draw();
  c19.draw();
  c20.draw();
  // side 3.0 - intersecting points.
  /** /
   cIn9_c.draw();
   cIn10_c.draw();
  /**/
  // side 3.1
  c21.draw();
  c22.draw();
  c23.draw();
  // side 3.1 - intersecting points.
  /** /
   cIn11_c.draw();
   cIn12_c.draw();
  /**/

  // interior circle (1 unit)
  c4.draw();
  // interior intersecting points
  /** /
   c25.draw();
   c26.draw();
   c27.draw();
  /**/

  // exterior circle (3 units)
  c5.draw();
  // exterior intersecting points
  /** /
   c28.draw();
   c29.draw();
   c30.draw();
  /**/

  // Draw enclosing hexagon.
  polygon(6, p1.x, p1.y, unit*8*2, unit*8*2, 0);

  ///// Draw figure. 1/3
  strokeWeight(figureStrokeWeight);
  stroke(figureStrokeColor, strokeAlpha);
  fill(figureColor, fillAlpha);

  drawPolygon(new Circle[] { 
    c3, c18, cIn9_c, cIn10_c, c27, cIn2_c, cIn1_c, c6, c1, c9, cIn3_c, cIn4_c, 
    c25, cIn6_c, cIn5_c, c12, c2, c15, cIn7_c, cIn8_c, 
    c26, cIn12_c, cIn11_c, c21
  }
  );

  noFill();
  return gridStops;
}

void drawPolygon(Circle[] poly)
{
  if (poly.length < 3) return;
  beginShape();
  for (int i=0; i < poly.length; i++)
  {
    vertex(poly[i].centre.x, poly[i].centre.y);
  }
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
        p, p
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


float clamp(float minimum, float maximum, float value)
{
  if (value < minimum) return minimum;
  if (value > maximum) return maximum;
  return value;
}


