
/**
 * stores coordinates for a cubic Bezier vertex
 */
class BezVertex {
  /** x-coordinate of first control point */
  protected float cx1;
  /** y-coordinate of first control point */
  protected float cy1;
  /**  x-coordinate of second control point  */
  protected float cx2;
  /**  y-coordinate of second control point  */
  protected float cy2;
  /** x-coordinate of anchor point */
  protected float x;
  /** y-coordinate of anchor point */
  protected float y;

  public BezVertex(float cx1, float cy1, float cx2, float cy2, float x, float y) {
    this.cx1 = cx1;
    this.cy1 = cy1;
    this.cx2 = cx2;
    this.cy2 = cy2;
    this.x = x;
    this.y = y;
  }

  public BezVertex() {
    this(0, 0, 0, 0, 0, 0);
  }

  public float cx1() {
    return cx1;
  }
  public void setCx1(float newCx1) {
    cx1 = newCx1;
  }

  public float cy1() {
    return cy1;
  }
  public void setCy1(float newCy1) {
    cy1 = newCy1;
  }

  public float cx2() {
    return cx2;
  }
  public void setCx2(float newCx2) {
    cx2 = newCx2;
  }

  public float cy2() {
    return cy2;
  }
  public void setCy2(float newCy2) {
    cy2 = newCy2;
  }

  public float x() {
    return x;
  }
  public void setX(float newX) {
    x = newX;
  }

  public float y() {
    return y;
  }
  public void setY(float newY) {
    y = newY;
  }
  
  public float[] coords() {
    float[] knots = new float[6];
    knots[0] = cx1;
    knots[1] = cy1;
    knots[2] = cx2;
    knots[3] = cy2;
    knots[4] = x;
    knots[5] = y;
    return knots;
  }

  /** 
   * only valid to call this within a beginShape/endShape pair and after 
   * an initial vertex has been set with a call to vertex() 
   */
  public void draw() {
    bezierVertex(cx1, cy1, cx2, cy2, x, y);
  }
}


public class BezShape {
  /** initial x-coordinate */
  protected float x;
  /** initial y-coordinate */
  protected float y;
  /** x-coordinate of center of transformation */
  protected float xctr;
  /** y-coordinate of center of transformation */
  protected float yctr;
  /** flags if shape has a center point set */
  protected boolean hasCenter;
  /** list of bezier vertices */
  private ArrayList<BezVertex> curves;
  /** flags if shape is closed or not */
  protected boolean isClosed;
  /** flags if shape is filled or not */
  protected boolean hasFill;
  /** flags if shape has a stroke or not */
  protected boolean hasStroke;
  /** fill color for shape */
  protected color fillColor;
  /** stroke color for shape */
  protected color strokeColor;
  /** stroke weight for shape */
  protected float weight;

  public BezShape(float x, float y, boolean isClosed) {
    this.x = x;
    this.y = y;
    setHasCenter(false);
    this.curves = new ArrayList<BezVertex>();
    this.isClosed = isClosed;
    setHasStroke(true);
    setStrokeColor(color(0,0,0));
    setWeight(1);
    setFillColor(color(255, 255, 255));
    setHasFill(false);
  }

  public BezShape() {
    this(0, 0, true);
  }

  public BezShape(float x, float y) {
    this(x, y, true);
  }

  public BezShape(float ax1, float ay1, float cx1, float cy1, float cx2, float cy2, 
                  float ax2, float ay2) {
    this(ax1, ay1, true);
    this.append(new BezVertex(cx1, cy1, cx2, cy2, ax2, ay2));
  }

  public BezShape(float ax1, float ay1, float cx1, float cy1, float cx2, float cy2, 
                  float ax2, float ay2, boolean isClosed) {
    this(ax1, ay1, isClosed);
    this.append(new BezVertex(cx1, cy1, cx2, cy2, ax2, ay2));
  }


  public void append(BezVertex vert) {
    curves.add(vert);
  }

  public void append(float cx1, float cy1, float cx2, float cy2, float x, float y) {
    this.append(new BezVertex(cx1, cy1, cx2, cy2, x, y));
  }


  public float x() {
    return x;
  }
  public void setX(float newX) {
    x = newX;
  }


  public float y() {
    return y;
  }
  public void setY(float newY) {
    y = newY;
  }


  public float xctr() {
    if (!hasCenter) {
      calculateCenter();
    }
    return xctr;
  }

  public float yctr() {
    if (!hasCenter) {
      calculateCenter();
    }
    return yctr;
  }
  
  public void setCenter(float xctr, float yctr) {
    this.xctr = xctr;
    this.yctr = yctr;
    setHasCenter(true);
  }

  public boolean hasCenter() {
    return hasCenter;
  }
  public void setHasCenter(boolean newHasCenter) {
    hasCenter = newHasCenter;
  }

  private void calculateCenter() {
    // skip the start vertex at (x,y), it will show up in values from curveIterator
    float xsum = 0;
    float ysum = 0;
    float count = 0;
    ListIterator<BezVertex> it = curveIterator();
    while (it.hasNext()) {
      BezVertex bez = it.next();
      xsum += bez.x();
      ysum += bez.y();
      count++;
    }
    setCenter(xsum/count, ysum/count);
  }


public ArrayList<BezVertex> curves() {
    return curves;
  }
  public void setCurves(ArrayList<BezVertex> newCurves) {
    curves = newCurves;
  }


  public boolean isClosed() {
    return isClosed;
  }
  public void setIsClosed(boolean newIsClosed) {
    isClosed = newIsClosed;
  }


  public boolean hasFill() {
    return hasFill;
  }
  public void setHasFill(boolean newHasFill) {
    hasFill = newHasFill;
  }
  public void setNoFill() {
    setHasFill(false);
  }


  public boolean hasStroke() {
    return hasStroke;
  }
  public void setHasStroke(boolean newHasStroke) {
    hasStroke = newHasStroke;
  }
  public void setNoStroke() {
    setHasStroke(false);
  }


  public color fillColor() {
    return fillColor;
  }
  public void setFillColor(color newFillColor) {
    fillColor = newFillColor;
    setHasFill(true);
  }


  public color strokeColor() {
    return this.strokeColor;
  }
  public void setStrokeColor(color newStrokeColor) {
    this.strokeColor = newStrokeColor;
    this.setHasStroke(true);
  }


  public float weight() {
    return weight;
  }
  public void setWeight(float newWeight) {
    weight = newWeight;
  }


  // return initial vertex as an array of two floats
  public float[] startVertex() {
    float[] pt = new float[2];
    pt[0] = this.x;
    pt[1] = this.y;
    return pt;
  }


  public ListIterator <BezVertex> curveIterator() {
    return curves.listIterator();
  }

  /** 
   * calls beginShape and endShape on its own
   */
  public void draw() {
    beginShape();
    if (hasFill()) {
      fill(fillColor);
    }
    else {
      noFill();
    }
    if (hasStroke()) {
      stroke(strokeColor);
    }
    else {
      noStroke();
    }
    strokeWeight(weight);
    vertex(this.x, this.y);
    ListIterator<BezVertex> it = curveIterator();
    while (it.hasNext()) {
      BezVertex bez = it.next();
      bez.draw();
    }
    if (isClosed()) {
      endShape(CLOSE);
    }
    else {
      endShape();
    }
  }
  
}



