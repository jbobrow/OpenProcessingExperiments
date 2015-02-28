

SimpleShape tri;
SimpleShape box;
SimpleShape hex;

// booleans if shapes are touching
boolean triBoxSeparated;
boolean triHexSeparated;
boolean boxHexSeparated;

void setup() {
  size(480, 480);

  /* first 2 parameters = center of shape, 3rd parameter = radius of shape, 
   char = rotation key, last parameter = number of sides */
  tri = new SimpleShape(100, 300, 70, 't', 3);
  box = new SimpleShape(330, 100, 80, 'b', 4);
  hex = new SimpleShape(300, 300, 60, 'h', 6);
}

void draw() {
  background(255);

  // render shapes
  tri.drawShape();
  box.drawShape();
  hex.drawShape();

  // there are 3 possible intersections in this example
  triBoxSeparated = checkIfSeparated(tri, box, triBoxSeparated);
  triHexSeparated = checkIfSeparated(tri, hex, triHexSeparated);
  boxHexSeparated = checkIfSeparated(box, hex, boxHexSeparated);

  fill(0);
  text("T to rotate triangle", 30, 40);
  text("B to rotate box", 30, 60);
  text("H to rotate hexagon", 30, 80);
  text("Drag center dot to move shapes", 30, 100);
  text("Triangle and Box Separated: " + triBoxSeparated, 30, 400);
  text("Triangle and Hexagon Separated: " + triHexSeparated, 30, 420);
  text("Box and Hexagon Separated: " + boxHexSeparated, 30, 440);
}

/* This code is hard to explain without visuals. 
 Look up 'AABB Separating Hyperplane Theorem' to get an idea of what's happening. */
boolean checkIfSeparated(SimpleShape s1, SimpleShape s2, boolean isSeparated) {
  for (int i = 0; i < s1.numSides; i++) {
    s1.setMinMax(s1.normal[i]);
    s2.setMinMax(s1.normal[i]);
    isSeparated = s2.maxProj < s1.minProj || s1.maxProj < s2.minProj;
    if (isSeparated) {
      return true;
    }
  }
  for (int i = 0; i < s2.numSides; i++) {
    s1.setMinMax(s2.normal[i]);
    s2.setMinMax(s2.normal[i]);
    isSeparated = s2.maxProj < s1.minProj || s1.maxProj < s2.minProj;
    if (isSeparated) {
      return true;
    }
  }
  return false;
}

void keyPressed() {
  tri.kPressed();
  box.kPressed();
  hex.kPressed();
}
void keyReleased() {
  tri.kReleased();
  box.kReleased();
  hex.kReleased();
}

void mousePressed() {
  tri.mPressed();
  box.mPressed();
  hex.mPressed();
}
void mouseReleased() {
  tri.mReleased();
  box.mReleased();
  hex.mReleased();
}


class SimpleShape {

  float xCenter, yCenter;
  float[] x, y;
  PVector[] vecs, normal;
  int numSides;
  float radius;
  // these will be used later in setMinMax()
  float minProj;
  float maxProj;
  // vars for user events
  char rotationKey;
  float angle;
  boolean isRotating;
  boolean isDragging;

  SimpleShape(float xc, float yc, float r, char c, int sides) {
    rotationKey = c;
    radius = r;
    numSides = sides;

    xCenter = xc;
    yCenter = yc;
    x = new float[numSides];
    y = new float[numSides];

    // one vector for each point; each normal corresponds to one of the sides
    vecs = new PVector[numSides];
    normal = new PVector[numSides];
    for (int i = 0; i < vecs.length; i++) {
      vecs[i] = new PVector();
      normal[i] = new PVector();
    }

    // set the points around the center
    setPoints();
  }

  void drawShape() {
    // set the vectors from the origin to each point
    for (int i = 0; i < x.length; i++) {
      vecs[i].x = x[i];
      vecs[i].y = y[i];
    }
    // rotate
    if (isRotating) {
      angle += .01;
      // update the points after rotation or dragging
      setPoints();
    }
    // move with mouse
    if (isDragging) {
      xCenter = mouseX;
      yCenter = mouseY;
      // update the points after rotation or dragging
      setPoints();
    }

    // draw the shape
    stroke(0);
    noFill();
    beginShape();
    for (int i = 0; i < x.length; i++) {
      vertex(x[i], y[i]);
    }
    endShape(CLOSE);

    // draw ellipse at the center
    fill(0);
    ellipse(xCenter, yCenter, 10, 10);
  }

  void setPoints() {
    /* defining points as real positions on the screen rather than within a rotation matrix
     allows for accurate vector operations */
    for (int i = 0; i < x.length; i++) {
      float currentAngle = i * TWO_PI / numSides;
      x[i] = xCenter + radius*cos(currentAngle + PI/numSides + angle);
      y[i] = yCenter + radius*sin(currentAngle + PI/numSides + angle);
    }
    // one normal for each edge; given Vector(x, y), its normal is Normal(-y, x)
    for (int i = 0; i < x.length-1; i++) {
      normal[i+1] = new PVector(-y[i+1] + y[i], x[i+1] - x[i]);
    }
    // find the normal for the edge between the first and last points
    normal[0] = new PVector(-y[0] + y[x.length-1], x[0] - x[x.length-1]);
  }

  void setMinMax(PVector axis) {
    /* arbitrarily set the minimum and maximum projections on 'axis' 
     to be the dot-product of the first point's vector against 'axis' */
    minProj = vecs[0].dot(axis);
    maxProj = minProj;
    // loop through the remaining points to determine the ACTUAL min and max
    for (int i = 1; i < vecs.length; i++) {
      float currentProj = vecs[i].dot(axis);
      if (currentProj < minProj) {
        minProj = currentProj;
      }
      if (currentProj > maxProj) {
        maxProj = currentProj;
      }
    }
  }

  // key events
  void kPressed() {
    if (key == rotationKey) {
      isRotating = true;
    }
  }
  void kReleased() {
    isRotating = false;
  }

  // mouse events
  void mPressed() {
    if (dist(mouseX, mouseY, xCenter, yCenter) < 10) {
      isDragging = true;
    }
  }
  void mReleased() {
    isDragging = false;
  }
}



