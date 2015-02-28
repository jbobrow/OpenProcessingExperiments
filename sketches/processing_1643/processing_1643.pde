
/** 
 * Dividing Polygons
 * by Algirdas Rascius.
 * 
 * Mouse-click to restart.
 */ 
 
static final int ANIMATE_STEPS = 50;
static final float MIN_SIDE = 30;

LinkedList activePolygons;
LinkedList splittablePolygons;
LinkedList donePolygons;

void setup() {
  size(500, 500);
  background(0);
  colorMode(HSB, TWO_PI, 1, 1, 1);
  smooth();
  stroke(0);
  strokeWeight(2);
  initialize();
  frameRate(25);
}

void draw() {
  // Animate
  filter(ERODE);
  filter(BLUR);
  drawPolygons(activePolygons);
  drawPolygons(splittablePolygons);
  drawPolygons(donePolygons);
  
  // Check for polygons that ended to animate 
  for (Iterator i=activePolygons.iterator(); i.hasNext();) {
    Polygon p = (Polygon)i.next();
    if (p.isAnimationDone()) {
      i.remove();
      if (p.canSplit()) {
        splittablePolygons.add(p);
      } else {
        donePolygons.add(p);
      }
    }  
  }
  
  // Randomly split polygons
  float splitProbability = 1.0/(splittablePolygons.size()+10);
  for (Iterator i=splittablePolygons.iterator(); i.hasNext();) {
    Polygon p = (Polygon)i.next();
    if (random(1)<splitProbability) {
      i.remove();      
      p.splitPolygon(activePolygons);    
    }  
  }
  
  // Reset, if finished  
  if (activePolygons.size() == 0 && splittablePolygons.size() == 0) {
    initialize();
  }
}

void drawPolygons(LinkedList polygons) {
  for (Iterator i=polygons.iterator(); i.hasNext();) {
    Polygon s = (Polygon)i.next();
    s.drawPolygon();
  }
}

void mousePressed() {
  initialize();
}

void keyPressed() {
  initialize();
}

void initialize() {
  activePolygons = new LinkedList();
  splittablePolygons = new LinkedList();
  donePolygons = new LinkedList();
  activePolygons.add(new Polygon(new float[]{3, width-3, width-3, 3}, new float[]{3, 3, height-3, height-3}, random(TWO_PI), TWO_PI/8));
}


/*********************************************************************************************************
 * Class representing polygon.
 *********************************************************************************************************/
class Polygon {
  float[] x;
  float[] y;
  float hueValue;
  float hueDelta;  
  int animationStep;
  
  /**
   * Constructs polugon instance.
   */
  Polygon(float[] x, float[] y, float hueValue, float hueDelta) {
    this.x = x;
    this.y = y;
    this.hueValue = hueValue;
    this.hueDelta = hueDelta;
    this.animationStep = 0;
  }
  
  /**
   * Draws polygon. In order to get rounded corners, polygon is drawn as a bezzier curve. 
   * Middle points of polygon sides are used as anchor points and polynon vertices as control points.
   * Initially polygon is partially transparent and transparency decreases after each redrawing.
   */
  void drawPolygon() {
    animationStep++;
    fill(color(hueValue, 1, 1, 0.1 + 0.9*pow((float)animationStep/ANIMATE_STEPS, 2)));
    stroke(color(0, 1, 0, 0.1 + 0.9*pow((float)animationStep/ANIMATE_STEPS, 2)));
    beginShape();
    vertex((x[0]+x[1])/2, (y[0]+y[1])/2);
    int n = x.length;
    for (int i=0; i<n; i++) {
      bezierVertex(x[(i+1)%n], y[(i+1)%n], x[(i+1)%n], y[(i+1)%n], (x[(i+1)%n]+x[(i+2)%n])/2, (y[(i+1)%n]+y[(i+2)%n])/2);
    }
    endShape();
  }
  
  /**
   * Returns true, if polygon animation is complete (if it is no more semi-transparent).
   */ 
  boolean isAnimationDone() {
    return animationStep >= ANIMATE_STEPS;
  }

  /**
   * Returns true, if polygon can be split into two smaller polygons.
   * Polygon can be, split if at least two sides are splitable. 
   */
  boolean canSplit() {
    int splitableSides = 0;
    int n = x.length;
    for (int i=0; i<n; i++) {
      if (isSplitableSide(i)) {
        splitableSides++;
      }
    }   
    return splitableSides >= 2;
  }
  
  /**
   * Returns true, if specified side is splitable.
   * Side can be split, if it is longer than two miminum side lengths. 
   */
  boolean isSplitableSide(int i) {
    int n = x.length;
    return dist(x[i], y[i], x[(i+1)%n], y[(i+1)%n]) >= 2 * MIN_SIDE;    
  }
  
  /**
   * Splits polygon into two. Append resulting polygons to specified list.
   */
  void splitPolygon(LinkedList targetList) {
    int n = x.length;

    // Randomly get first side to be split
    int side1;
    do {
      side1 = (int)random(n);
    } while (!isSplitableSide(side1));

    // Randomly get second side to be split
    int side2;
    do {
      side2 = (int)random(n);
    } while (side1 == side2 || !isSplitableSide(side2));
    
    // Get randon split points
    float c1 = getRandomSplitPoint(side1);
    float c2 = getRandomSplitPoint(side2);

    // Do split
    targetList.add(createNew(side1, side2, c1, c2, 1));
    targetList.add(createNew(side2, side1, c2, c1, -1));
  }

  /**
   * Create new polygon that is splitted half of this one
   */
  Polygon createNew(int side1, int side2, float c1, float c2, float hueMultiplier) {
    int n = x.length;

    float xSplit1 = x[side1]*c1 + x[(side1+1)%n]*(1-c1);
    float ySplit1 = y[side1]*c1 + y[(side1+1)%n]*(1-c1);

    float xSplit2 = x[side2]*c2 + x[(side2+1)%n]*(1-c2);
    float ySplit2 = y[side2]*c2 + y[(side2+1)%n]*(1-c2);
    
    int n1 = (side2-side1+n) % n + 2;
    float[] x1 = new float[n1];
    float[] y1 = new float[n1];
    x1[0] = xSplit2;
    y1[0] = ySplit2;
    x1[1] = xSplit1;
    y1[1] = ySplit1;
    for (int i=2; i<n1; i++) {
      x1[i] = x[(side1+i-1)%n];
      y1[i] = y[(side1+i-1)%n];
    }
    return new Polygon(x1, y1, (hueValue+hueDelta)%TWO_PI*hueMultiplier, hueDelta*0.7);
  }
  
  /**
   * Returns random split point for specifed side. Split point value is in interval (0,1).
   */
  float getRandomSplitPoint(int side) {
    int n = x.length;
    float sideLength = dist(x[side], y[side], x[(side+1)%n], y[(side+1)%n]);
    float c = MIN_SIDE/sideLength;
    return random(c, 1-c);
  }
}
  

