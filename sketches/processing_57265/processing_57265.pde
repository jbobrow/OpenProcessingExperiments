
import java.util.ArrayList;
import com.ignotus.aifile.*;


/**
* Created by Paul Hertz, March 2012 
* Free for any use, credit is appreciated.
* Uses the latest version of my IgnoCodeLib, http://paulhertz.net/ignocodelib/
* 
* Often when creating games or interactive animations, you want objects that move off the display
* on one edge to reappear on the opposite edge. What goes off the top reappears on the bottom, 
* what leaves by the right edge comes back from the left edge, and so on. You could think of 
* the display rectangle as a representation of a torus, a topological doughnut created by sealing
* the top edge to the bottom edge (creating a tube) and the left edge to the right edge. 
* You could also think of this as a representation of a tiled plane, where the display rectangle
* is a tile repeated to infinity on all sides. Points on a given tile are mapped to their images
* on the repeated tiles.
* 
* In such a situation, the shortest line connecting two points on the torus is not necessarily 
* a line entirely on the display but a line that crosses over the connected edges. Similarly,
* the closest image of a test point on a tiled plane to a reference point on a particular tile 
* may be on a different tile from the reference point.
* 
* This applet demonstrates a fast algorithm for finding shortest line between two points on a torus
* or equivalently the shortest line between a reference point on a specific tile and a test point
* and its images on a tiled plane. It has need need of the addition/subtraction, multiplication 
* and square root operations used for finding distances--that is why it's fast.  
* 
* I wrote this algorithm to help model steering behaviors originally described by Craig Reynolds.
* An applet that uses this torus mapping (and also allows you to use a plane mapping) can 
* be found here: 
* 
* Instructions: drag the red and green points around in the central rectangle. A line will connect 
* the round green point to closest image of the diamond-shaped red point.
*
*/

/** x-coordinate of center of display */
float xctr;
/** y-coordinate of center of display */
float yctr;
/** torus width */
float torW;
/** torus height */
float torH;
/** half torus width */
float halfTorW;
/** half torus height */
float halfTorH;
/** rectangle representing torus bounds */
BezRectangle torusRect;
/** reference point */
BezShape refPoint;
/** bounds rectangle around reference point */
BezRectangle refRect;
/** shape most recently selected for translating */
BezShape selectedShape;
/** the point we are mapping to a torus or tiled plane */
BezShape testPoint;
float refX, refY, selX, selY;
int outcode;
int prevOutcode;
int code;
PFont displayFont;
PointText displayText;


public void setup() {
  size(540, 420);
  smooth();
  frameRate(12);
  xctr = width/2.0f;
  yctr = height/2.0f;
  torW = (width - 24)/3.0f;
  halfTorW = torW/2.0f;
  torH = (height - 24)/3.0f;
  halfTorH = torH/2.0f;
  stroke(0);
  fill(40, 200, 80);
  // make a circle for the reference point
  refPoint = BezCircle.makeCenterRadius(this, xctr, yctr, 8);
  refX = refPoint.xctr();
  refY = refPoint.yctr();
  stroke(144);
  noFill();
  // define a rectangle around the test point
  refRect = BezRectangle.makeCenterWidthHeight(this, xctr, yctr, torW, torH);
  noStroke();
  fill(240, 50, 0);
  // make a diamond shape for the test point
  testPoint = BezRegularPoly.makeCenterRadiusSides(this, refX + torW/4, refY + torH/4, 4, 4);
  selX = testPoint.xctr();
  selY = testPoint.yctr();
  selectedShape = testPoint;
  displayFont = createFont("Helvetica", 12);
  displayText = new PointText(this, width - 180, height - 20, "");
  displayText.setFont(displayFont);
}

public void draw() {
  background(255);
  drawGrid();
  // if there is a shape selected, move it the distance between the 
  // current mouse position and the previous mouse position
  if (mousePressed) {
    if (null != selectedShape) {
      float tx = mouseX - pmouseX;
      float ty = mouseY - pmouseY;
      selectedShape.translateShape(tx, ty);
      if (selectedShape.equals(refPoint)) {
        // also translate the reference rectangle
        refRect.translateShape(tx, ty);
        refX = refPoint.xctr();
        refY = refPoint.yctr();
      }
      else {
        // the only other point available for translating is testPoint
        selX = selectedShape.xctr();
        selY = selectedShape.yctr();
      }
    }
  }
  // display copies of the test point as mapped to a torus of dimensions torW, torH
  testPoint.setFillColor(color(140, 140, 140));
  tileShapeOnTorus(testPoint);
  testPoint.setFillColor(color(240, 50, 0));
  testPoint.draw();
  // get a list of points 
  ArrayList<PVector> testPoints = torusPoints(selX, selY);
  PVector ref = new PVector(refX, refY);
  PVector sel = new PVector(selX, selY);
  float d = PVector.dist(ref, sel);
  PVector outvec = sel;
  // find the closest image of the test point on a torus (or on a tiled plane) by explicitly 
  // calculating distances (i.e., by subtracting, multiplying and taking square roots)
  for (PVector vec : testPoints) {
    if (PVector.dist(ref, vec) < d) {
      d = PVector.dist(ref, vec);
      outvec = vec;
    }
  }
  noFill();
  stroke(220, 0, 0);
  // draw a line from the reference point to the closest image of the test point
  line(refX, refY, outvec.x, outvec.y);
  // find the closest image of the test point using only comparison and addition operations
  PVector torvec = nearestPointOnTorus(ref, sel);
  drawText("mapped vector = "+ torvec.x +", "+ torvec.y);
  // every time the outcode changes, print out some information to the console
  if (outcode != prevOutcode) {
    println("-- outcode = "+ outcode);
    // the outcode set in nearestPointOnTorus should be the same as the 
    // pointRectOutcode value when testing (selX, selY), the test point coordinates, 
    // against refRect, the bounding rectangle around refPoint
    code = pointRectOutcode(selX, selY, refRect);
    println("-- code = "+ code);
    prevOutcode = outcode;
    println("outvec = "+ outvec.x +", "+ outvec.y);
    println("torvec = "+ torvec.x +", "+ torvec.y);
    println();
  }
  refPoint.draw();
  refRect.draw();
}

public void drawText(String txt) {
  textFont(displayFont, 12);
//    float tw = textWidth(txt);
//    float th = g.textSize + this.textDescent();
  displayText.setText(txt);
  displayText.draw();
}

public void mousePressed() {
  selectedShape = null;
  if (testPoint.containsPoint(mouseX, mouseY)) {
    selectedShape = testPoint;
  }
  if (refPoint.containsPoint(mouseX, mouseY)) {
    selectedShape = refPoint;
  }
}

public void mouseReleased() {

}

public void drawGrid() {
  torusRect = BezRectangle.makeLeftTopWidthHeight(this, xctr - halfTorW, yctr - halfTorH, torW, torH);
  torusRect.setNoFill();
  torusRect.setStrokeColor(color(240, 200, 140));
  // draw the 9 tiles adjacent to the central tile
  tileShapeOnTorus(torusRect);
  torusRect.setStrokeColor(color(90, 50, 240));
  torusRect.draw();
}

public void tileShapeOnTorus(BezShape sh) {
  // top row
  sh.translateShape(-torW, -torH);
  sh.draw();
  sh.translateShape(torW, 0);
  sh.draw();
  sh.translateShape(torW, 0);
  sh.draw();
  // middle row without central shape
  sh.translateShape(-torW * 2, torH);
  sh.draw();
  sh.translateShape(torW * 2, 0);
  sh.draw();
  // bottom row
  sh.translateShape(-torW * 2, torH);
  sh.draw();
  sh.translateShape(torW, 0);
  sh.draw();
  sh.translateShape(torW, 0);
  sh.draw();
  // translate shape back to original position
  sh.translateShape(-torW, -torH);
}

public ArrayList<PVector> torusPoints(float x, float y) {
  ArrayList<PVector> torusPoints = new ArrayList<PVector>();
  // top row
  torusPoints.add(new PVector(x - torW, y - torH));
  torusPoints.add(new PVector(x, y - torH));
  torusPoints.add(new PVector(x + torW, y - torH));
  // middle row, without central point
  torusPoints.add(new PVector(x - torW, y));
  torusPoints.add(new PVector(x + torW, y));
  // bottom row
  torusPoints.add(new PVector(x - torW , y + torH));
  torusPoints.add(new PVector(x, y + torH));
  torusPoints.add(new PVector(x + torW, y + torH));
  return torusPoints;
}

/**
 * Returns an integer indicating the spatial relationship of a point to a rectangle.
 * A value of 5 indicates the point is inside the rectangle, other values indicate
 * it is above, below, left or right of the rectangle as shown in the following diagram.
 * 
 *       |   |
 *     1 | 4 | 7
 *    ___|___|___
 *       |   |
 *     2 | 5 | 8 
 *    ___|___|___
 *       |   |
 *     3 | 6 | 9
 *       |   |  
 *       
 * Encoding of this sort is used, for example, in optimizing line intersection tests.
 *            
 * @param x     x-coordinate of point
 * @param y     y-coordinate of point
 * @param lim   a rectangle
 * @return      integer value encoding position of point relative to rectangle
 */
public int pointRectOutcode(float x, float y, BezRectangle lim) {
    int code = 0;
    float left = lim.getLeft();
    float right = lim.getRight();
    float top = lim.getTop();
    float bottom = lim.getBottom();
    if (x < left ) {
      if (y < top) {
        code = 1;
      }
      else if (y > bottom) {
        code = 3;
      }
      else {
        code = 2;
      }
    }
    else if (x > right) {
      if (y < top) {
        code = 7;
      }
      else if (y > bottom) {
        code = 9;
      }
      else {
        code = 8;
      }
    }
    else {
      if (y < top) {
        code = 4;
      }
      else if (y > bottom) {
        code = 6;
      }
      else {
        code = 5;
      }
    }
    return code;
}

/**
 * The outcode value set in this method indicates the spatial relationship of a point to a rectangle.
 * See pointRectOutcode method for details. 
 *       
 * @param vec         the reference vector (location) 
 * @param mappedVec   the vector (location) to map to a torus 
 * @return            a PVector with the value of the closest image of mappedVec 
 */
public PVector nearestPointOnTorus(PVector vec, PVector mappedVec) {
  outcode = 0;
  float x = vec.x;
  float y = vec.y;
  float left = x - halfTorW;
  float right = x + halfTorW;
  float top = y - halfTorH;
  float bottom = y + halfTorH;
  float mx = mappedVec.x;
  float my = mappedVec.y;
  PVector out;
    if (mx < left ) {
      if (my < top) {
        outcode = 1;
        out = new PVector(mx + torW, my + torH);
      }
      else if (my > bottom) {
        outcode = 3;
        out = new PVector(mx + torW, my - torH);
      }
      else {
        outcode = 2;
        out = new PVector(mx + torW, my);
      }
    }
    else if (mx > right) {
      if (my < top) {
        outcode = 7;
        out = new PVector(mx - torW, my + torH);
      }
      else if (my > bottom) {
        outcode = 9;
        out = new PVector(mx - torW, my - torH);
      }
      else {
        outcode = 8;
        out = new PVector(mx - torW, my);
      }
    }
    else {
      if (my < top) {
        outcode = 4;
        out = new PVector(mx, my + torH);
      }
      else if (my > bottom) {
        outcode = 6;
        out = new PVector(mx, my - torH);
      }
      else {
        outcode = 5;
        out = new PVector(mx, my);
      }
    }
    return out;
}


