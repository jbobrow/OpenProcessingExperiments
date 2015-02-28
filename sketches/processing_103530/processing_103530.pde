
/**
 * Draw a circular array of colored rectangles, displaying the full range
 * of hues.
 *
 * Bruce Wilson, 4/26/2013
 */

final static float kCircleRadius = 150.0;

final static int   kNumRectangles = 60;
final static float kRectLength = 100.0;
final static float kRectWidth = (TWO_PI * kCircleRadius / (float)kNumRectangles) - 5;
// final static float kRectWidth = 40.0;  // fixed width

final static int   kLabelSize = 28;

CircleOfRectangles circOfRect;
color centerColor = color(255, 0, 0);
float hue = 0.0;   // 0 - 360

void setup() {
  size(600, 600);

  float xc = width / 2.0;
  float yc = height / 2.0;
  circOfRect = new CircleOfRectangles(xc, yc, kCircleRadius, kNumRectangles, kRectWidth, kRectLength);

  smooth();
  colorMode(HSB, 360, 100, 100);
  circOfRect.draw();
}

void draw() {
  float xc = width / 2.0;
  float yc = height / 2.0;
  
  // Change the hue of the center area depending on mouse position
  if ( circOfRect.isMouseInRectangle() ) {
    float mouseAngle = circOfRect.getMouseAngle();
    hue = map(mouseAngle, 0.0, TWO_PI, 0.0, 360.0);
    centerColor = color(hue, 100, 100);
  }
  
  // Draw the central filled circle
  fill(centerColor);
  float ellipseDiameter = 2.0 * kCircleRadius - 20.0;
  ellipse(xc, yc, ellipseDiameter, ellipseDiameter);
  
  // Draw the color value in the center of the circle
  fill(kLabelSize);
  textAlign(CENTER, CENTER);
  textSize(kLabelSize);
  int textPosFudge = 3;
  text((int)hue, xc + textPosFudge, yc - textPosFudge);
}

/**
 * CircleOfRectangles
 *
 * This default implementation draws a spectrum of colored rectangles.
 * It assumes that HSB mode is set like: colorMode(HSB, 360, 100, 100)
 *
 * Bruce Wilson, 4/26/2013
 */

class CircleOfRectangles {
  float xCenter;
  float yCenter;
  float radius;
  int   numRects;
  float rectWidth;
  float rectLength;
  
  CircleOfRectangles(float xCenter, float yCenter, float radius, int numRects, float rectWidth, float rectLength) {
    this.xCenter = xCenter;
    this.yCenter = yCenter;
    this.radius = radius;
    this.numRects = numRects;
    this.rectWidth = rectWidth;
    this.rectLength = rectLength;
  }
  
  void draw() {
    pushStyle();
    stroke(80);
    rectMode(CENTER);
    
    float incrAngle = TWO_PI / (float)numRects;
    for( int i = 0; i < numRects; i++ ) {
      pushMatrix();
      translate(xCenter, yCenter);
      rotate((float)i * incrAngle);
      drawRect(i);
      popMatrix();
    }
    popStyle();
  }
  
  /**
   * Draw the i-th rectangle in the circle.
   *
   * This method can be overridden to draw each rectangle
   * in a different way.
   */
  void drawRect(int i) {
    fill(getRectColor(i));
    float rectX = radius + rectLength / 2.0;
    rect(rectX, 0.0, rectLength, rectWidth);
  }
  
  /*8
   * Default color scheme: assumes HSB mode.
   *
   * This method can be overridden to draw each rectangle using
   * a different color scheme.
   */
  color getRectColor(int i) {
    return color(360 * (float)i / (float)numRects, 100, 100);
  }
  
  boolean isMouseInRectangle() {
    float distFromCenter = dist(xCenter, yCenter, mouseX, mouseY);
    return ( (distFromCenter > radius) && (distFromCenter < radius + rectLength) );
  }
  
  /**
   * Return the angle (in radians) of the mouse point relative to
   * the center of the circle.
   */
  float getMouseAngle() {
    float distFromCenter = dist(xCenter, yCenter, mouseX, mouseY);
    
    // Using arc cosine give x and hypotenuse (dist from center)
    float angle = acos((mouseX - xCenter) / distFromCenter);
    
    // Reverse the angle if it's greater than PI (upper half of the circle
    // if drawing counterclockwise from right).
    //
    // This takes into account the y component of the mouse position: the
    // arccosine function only accounts for the x component.
    //
    if ( (mouseY - yCenter) < 0 ) angle = TWO_PI - angle;
    return angle;
  }
}



