
int[] coords;
float[] bounds;
int coordCount = 0;
boolean firstTime;
float xCtr;
float yCtr;

/**
 * Shows how to use arrays to store coordinate points entered by dragging the mouse.
 * Transforms the points and rotates them based on the location of the mouse.
 * Creates a copy of the points in a different color, location, rotation and refelction.
 */
public void setup() {
  size(480, 480);
  smooth();
  background(255);
  noFill();
  firstTime = true;
  // coords length should be an even number. Why?
  coords = new int[256];
  xCtr = width/2;
  yCtr = height/2;
}

public void draw() {
  // background(255, 255, 255);
  pushStyle();
  fill(255, 255, 255, 4);
  noStroke();
  rect(0,0, width, height);
  popStyle();
  if (mousePressed) {
    if (mouseX != pmouseX || mouseY != pmouseY) {
      if (coordCount < coords.length - 1) {
        coords[coordCount++] = mouseX;
        coords[coordCount++] = mouseY;
      }
      else {
        if (firstTime) {
          println("coordCount = " + coordCount);
          firstTime = false;
        }
      }
    }
  }
  if (firstTime) {
    pushMatrix();
    translate(16, 0);
    stroke(233, 29, 11);
    strokeWeight(2);
    // fill(220, 127);
    beginShape();
    for (int i = 0; i < coordCount; i += 2) {
      vertex(coords[i], coords[i+1]);
    }
    endShape();
    popMatrix();
  }
  else {
    if (null == bounds) {
      bounds = getBounds(coords);
    }
    stroke(55, 29, 233, 127);
    strokeWeight(1);
    float x = bounds[0];
    float y = bounds[1];
    float w = bounds[2] - x;
    float h = bounds[3] - y;
    float shapex = (x + bounds[2]) / 2;
    float shapey = (y + bounds[3]) / 2;
    rect(x, y, w, h);
    float ang = getAngle(mouseX - xCtr, mouseY - yCtr);    
    stroke(233, 29, 11);
    strokeWeight(2);
    // fill(220, 127);
    /*
    beginShape();
    for (int i = 0; i < coordCount; i += 2) {
      int x = coords[i];
      int y = coords[i + 1];
      float[] pt = rotatePointAroundPoint(x, y, xCtr, yCtr, ang);
      vertex(pt[0], pt[1]);
    }
    endShape();
    */
    /* */
    pushMatrix();
//    translate(xCtr, yCtr);
//    rotate(ang);
//    translate(-xCtr, -yCtr);
    translate(shapex, shapey);
    rotate(ang);
    translate(-shapex, -shapey);
    stroke(233, 29, 11);
    strokeWeight(2);
    // fill(220, 127);
    beginShape();
    for (int i = 0; i < coordCount; i += 2) {
      vertex(coords[i], coords[i+1]);
    }
    endShape();
    popMatrix();
    // again
    pushMatrix();
    translate(-50, 100);
    translate(shapex, shapey);
    scale(1, -1);
    rotate(ang + radians(90));
    translate(-shapex, -shapey);
    stroke(123, 246, 11);
    strokeWeight(2);
    // fill(220, 127);
    beginShape();
    for (int i = 0; i < coordCount; i += 2) {
      vertex(coords[i], coords[i+1]);
    }
    endShape();
    popMatrix();
   /* */
  }
}

// functions that transform points directly

public float[] translatePoint(float x, float y, float xTrans, float yTrans) {
  float[] xy = new float[2];
  xy[0] = x + xTrans;
  xy[1] = y + yTrans;
  return xy;
}

public float[] scalePoint(float x, float y, float xScale, float yScale) {
  float[] xy = new float[2];
  xy[0] = x * xScale;
  xy[1] = y * yScale;
  return xy;
}

public float[] scalePointAroundPoint(float x, float y, float xctr, 
float yctr, float xScale, float yScale) {
  float[] xy = new float[2];
  xy[0] = xctr + (x - xctr) * xScale;
  xy[1] = yctr + (y - yctr) * yScale;
  return xy;
}

public float[] rotatePoint(float x, float y, float theta) {
  float xy[] = new float[2];
  xy[0] = x * cos(theta) - y * sin(theta);
  xy[1] = x * sin(theta) + y * cos(theta);
  return xy;
}

public float[] rotatePointAroundPoint(float x, float y, float xctr, float yctr, float theta) {
  float sintheta = sin(theta);
  float costheta = cos(theta);
  float[] xy = translatePoint(x, y, -xctr, -yctr);
  x = xy[0] * costheta - xy[1] * sintheta;
  y = xy[0] * sintheta + xy[1] * costheta;
  return translatePoint(x, y, xctr, yctr);
}

/*
 * getAngle
 * Given dx and dy displacements on x axis and y axis, returns the 
 * angle of rotation, measured counterclockwise from 0 in Cartesian system, in radians.
 * angle will be measured clockwise in screen display system
 * @param dx   x coordinate of point
 * @param dy   y coordinate of point
 * @return     angle in radians
 */
public static float getAngle(float dx, float dy) {
  float angle;
  if (dx != 0) {
    angle = atan(abs(dy /dx));
  }
  else if (dy != 0) {
    angle = PI / 2;
  }
  else {
    angle = 0;
  }
  if (dx < 0) {
    if (dy < 0) {
      angle = angle + PI;
    }
    else {
      angle = PI - angle;
    }
  }
  else if (dy < 0) {
    angle = TWO_PI - angle;
  }
  return angle;
}

  public float[] getBounds(int[] points) {
    float xMin = points[0];
    float yMin = points[1];
    float xMax = xMin;
    float yMax = yMin;
    for(int i = 0; i < points.length - 1; i += 2) {
      float x = points[i];
      float y = points[i + 1];
      if (x < xMin) xMin = x;
      if (y < yMin) yMin = y;
      if (x > xMax) xMax = x;
      if (y > yMax) yMax = y;
    }
    float[] result = new float[4];
    result[0] = xMin;
    result[1] = yMin;
    result[2] = xMax;
    result[3] = yMax;
    println(result);
    return result;
  }


  public float[] arrayMinMax(int[] arr) {
    int min = arr[0];
    int max = min; 
    for(int i = 0; i < arr.length; i++) {
      int temp = arr[i];
      if (temp < min) min = temp;
      if (temp > max) max = temp; 
    }
    float[] result = new float[2];
    result[0] = min;
    result[1] = max;
    return result;
  }
