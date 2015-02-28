
/**
 * Display bezier curves whose control points can be moved.
 *
 * Press any key to redraw, creating a new set of curves.
 */
// Bruce Wilson, 6/21/2013

final static int kMarkSize = 5;
final static int kMargin = 40;
final static int kPadding = 10;
final static float kSelectionDistance = 10;
final static boolean kDebugging = false;

static color kCurveColor;
static color kControlLineColor;
static color kControlPointColor;

Panel panel1;
Panel panel2;
Panel panel3;
Panel panel4;

PVector[] curve1;
PVector[] curve2;
PVector[] curve3;
PVector[] curve4;

PVector trackingPoint = null;

void setup() {
  size(650, 650);
  smooth();
  
  int panelWidth = (width - 3 * kMargin) / 2;
  int panelHeight = (height - 3 * kMargin) / 2;

  kCurveColor = color(0, 0, 0);
  kControlLineColor = color(85, 175, 245);  // color(0, 0, 255);
  kControlPointColor = color(240);

  // top, left, width, height
  color panelColor = color(240);
  panel1 = new Panel(kMargin, kMargin, panelWidth, panelHeight, panelColor);
  panel2 = new Panel(kMargin, panelWidth + 2 * kMargin, panelWidth, panelHeight, panelColor);
  panel3 = new Panel(panelHeight + 2 * kMargin, kMargin, panelWidth, panelHeight, panelColor);
  panel4 = new Panel(panelHeight + 2 * kMargin, panelWidth + 2 * kMargin, panelWidth, panelHeight, panelColor);

  if ( kDebugging ) {
    println(panel1);
    println(panel2);
    println(panel3);
    println(panel4);
  }

  makeCurves();
  frameRate(60);  // Need full frame rate to drag control points
}

void makeCurves() {
  curve1 = makeCurve(panel1);
  curve2 = makeCurve(panel2);
  curve3 = makeCurve(panel3);
  curve4 = makeCurve(panel4);
}

void draw() {
  background(200);
  
  if ( (trackingPoint == null) && mousePressed ) {
    // Drag the curve's control points
    PVector nearPoint = null;
    if ( ((nearPoint = findNearPoint(curve1)) != null) ||
         ((nearPoint = findNearPoint(curve2)) != null) ||
         ((nearPoint = findNearPoint(curve3)) != null) ||
         ((nearPoint = findNearPoint(curve4)) != null) ) {
      trackingPoint = nearPoint;
    }
  }
  
  if ( trackingPoint != null ) {
      trackingPoint.x = mouseX;
      trackingPoint.y = mouseY;
  }
  
  panel1.display();
  panel2.display();
  panel3.display();
  panel4.display();
  
  drawBezier(curve1);
  drawBezier(curve2);
  drawBezier(curve3);
  drawBezier(curve4);
}

void keyPressed() {
  // Press any key to create new curves
  if ( key != CODED ) {
    makeCurves();
  }
}

void mouseReleased() {
  trackingPoint = null;
}

void drawBezier(PVector[] points) {
  pushStyle();
  noFill();
  stroke(kCurveColor);
  bezier(points[0].x, points[0].y, points[1].x, points[1].y,
         points[2].x, points[2].y, points[3].x, points[3].y);

  stroke(kControlLineColor);
  line(points[0].x, points[0].y, points[1].x, points[1].y);
  line(points[1].x, points[1].y, points[2].x, points[2].y);
  line(points[2].x, points[2].y, points[3].x, points[3].y);

  fill(kControlPointColor);
  ellipse(points[0].x, points[0].y, kMarkSize, kMarkSize);
  ellipse(points[1].x, points[1].y, kMarkSize, kMarkSize);
  ellipse(points[2].x, points[2].y, kMarkSize, kMarkSize);
  ellipse(points[3].x, points[3].y, kMarkSize, kMarkSize);
  popStyle();
}

PVector[] makeCurve(Panel panel) {
  PVector[] points = new PVector[4];
  
  int panelLeft = panel._left + kPadding;
  int panelRight = panel._left + panel._width - kPadding;
  int panelTop = panel._top + kPadding;
  int panelBottom = panel._top + panel._height - kPadding;
  for (int i = 0; i < points.length; i++) {
    points[i] = new PVector();
    points[i].x = random(panelLeft, panelRight);
    points[i].y = random(panelTop, panelBottom);
  }
  
  return points;
}

PVector findNearPoint(PVector[] curvePoints) {
  PVector pvMouse = new PVector(mouseX, mouseY);
  for(int i = 0; i < curvePoints.length; i++) {
    if ( pvMouse.dist(curvePoints[i]) < kSelectionDistance ) {
      return curvePoints[i];
    }
  }
  
  return null;
}

class Panel {
  public int _top;
  public int _left;
  public int _width;
  public int _height;
  public color _backgroundColor;
  
  public Panel(int t, int l, int w, int h, color c) {
    _top = t;
    _left = l;
    _width = w;
    _height = h;
    _backgroundColor = c;
  }
  
  void display() {
    pushStyle();
    fill(_backgroundColor);
    noStroke();
    rect(_left, _top, _width, _height);
    popStyle();
  }
  
  String toString() {
    return "Panel[top: " + _top + ", left: " + _left +
      ", width: " + _width + ", height: " + _height + "]";
  }
}



