
/**
 * Demonstration of how a curved chord is drawn in a chord chart.
 * Drag the handles on the radius lines to change the "tension"
 * of the chord - how closely the chord conforms to the radius lines.
 *
 * Press a number key to "replicate" the curve, 0 to restore a single curve.
 * Replicating the curve provides a way to visualize how a full chord chart
 * would look with the current chord tension.
 *
 * Bruce Wilson, 5/7/2013
 */

// Size and distances
final static int kMargin = 100;
final static int kMarkSize = 6;

final static float angleNear = HALF_PI / 15.0;
final static float controlPointNear = 0.10;

int xCenter, yCenter;
int diameter, radius;

// Main parameters
float angle1 = PI + HALF_PI / 2.0;
float angle2 = angle1 + HALF_PI;

float tension = 0.70;

// Bookkeeping
int draggingWhat = 0;  // 0, 1 or 2
final static int DRAG_NOTHING = 0;
final static int DRAG_ANGLE1 = 1;
final static int DRAG_ANGLE2 = 2;

int replication = 0;  // 0-9

float mouseAngle = 0.0;
float mouseToCenter = 0.0;

// Setup
void setup() {
  size(700, 700);
  
  diameter = min(width, height) - kMargin;
  radius = diameter / 2;
  xCenter = width / 2;
  yCenter = height / 2;
  
  noFill();
  smooth();
  frameRate(30);
}

// Draw
void draw() {
  background(255);
  
  stroke(0, 0, 0); 
  strokeWeight(0.5);
  ellipse(xCenter, yCenter, diameter, diameter);

  stroke(0, 120, 255);
  strokeWeight(1.0);
  rectMode(CENTER);
  
  // Drag the mouse to change the angle and tension
  if ( mousePressed ) {
    handleMouseDrag();
  }
  
  // Line at angle 1
  float x1 = xCenter + radius * cos(angle1);
  float y1 = yCenter + radius * sin(angle1);
  line(xCenter, yCenter, x1, y1);
  rect(x1, y1, kMarkSize, kMarkSize);  // mark the endpoint
  
  // Second control point
  float x2 = lerp(x1, xCenter, tension);
  float y2 = lerp(y1, yCenter, tension);
  rect(x2, y2, kMarkSize, kMarkSize);
  
  // Line at angle 2
  float x4 = xCenter + radius * cos(angle2);
  float y4 = yCenter + radius * sin(angle2);
  line(xCenter, yCenter, x4, y4);
  rect(x4, y4, kMarkSize, kMarkSize);
  
  // Third control point
  float x3 = lerp(x4, xCenter, tension);
  float y3 = lerp(y4, yCenter, tension);
  rect(x3, y3, kMarkSize, kMarkSize);
  
  // The curve between the lines
  stroke(0, 0, 0);
  stroke(2.0);
  bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  
  // Draw additional bezier curves if enabled
  if ( replication > 1 ) {
    float halfAngleDiff = abs(angle1 - angle2) / 2.0;
    float angleIncr = TWO_PI / (float)replication;
    
    float angle = min(angle1, angle2) + halfAngleDiff;
    for( int i = 0; i < replication; i++ ) {
      drawChord(angle - halfAngleDiff, angle + halfAngleDiff);
      angle += angleIncr;
    }
  }
}

void keyPressed() {
    // println("Key: " + key);
  if ( (key >= '0') && (key <= '9') ) {
    replication = int(key) - int('0');
  }
}

/**
 * Draw additional chords.
 */
void drawChord(float ang1, float ang2) {
  float x1 = xCenter + radius * cos(ang1);
  float y1 = yCenter + radius * sin(ang1);
  
  // Second control point
  float x2 = lerp(x1, xCenter, tension);
  float y2 = lerp(y1, yCenter, tension);
  
  // Line at angle 2
  float x4 = xCenter + radius * cos(ang2);
  float y4 = yCenter + radius * sin(ang2);
  
  // Third control point
  float x3 = lerp(x4, xCenter, tension);
  float y3 = lerp(y4, yCenter, tension);
  
  bezier(x1, y1, x2, y2, x3, y3, x4, y4);
}

/**
 * Track mouse position to change the angle and tension
 */
void handleMouseDrag() {
  mouseAngle = getMouseAngle();
  float mouseDistFromCenter = dist(xCenter, yCenter, mouseX, mouseY);
  mouseToCenter = 1.0 - mouseDistFromCenter / (float)radius;
  // println("mouseAngle=" + mouseAngle);
  
  // Start tracking which angle is being dragged
  if ( draggingWhat == DRAG_NOTHING ) {
    if ( isMouseNearAngle(angle1) ) {
      draggingWhat = DRAG_ANGLE1;
    } else if ( isMouseNearAngle(angle2) ) {
      draggingWhat = DRAG_ANGLE2;
    }
  }
  
  // Stop tracking if mouse goes outside circle (away from the angle line)
  if ( draggingWhat != DRAG_NOTHING ) {
    if ( !isMouseInCircle(mouseDistFromCenter) ) {
      draggingWhat = DRAG_NOTHING;
    }
  }
  
  // Change location of angle lines or control points
  // according to mouse movement
  if ( draggingWhat == DRAG_ANGLE1 ) {
    if ( isMouseNearControlPoint() ) {
      tension = mouseToCenter;
      tension = constrain(tension, 0.0, 1.0);
    } else {
      angle1 = mouseAngle;
      angle1 = constrain(angle1, 0.0, TWO_PI);
      // println("angle1=" + angle1);
    }
  } else if ( draggingWhat == DRAG_ANGLE2 ) {
    if ( isMouseNearControlPoint() ) {
      tension = mouseToCenter;
      tension = constrain(tension, 0.0, 1.0);
    } else {
      angle2 = mouseAngle;
      angle2 = constrain(angle2, 0.0, TWO_PI);
     // println("angle2=" + angle2);
    }
  }
}

void mouseReleased() {
  // println("Mouse released...");
  // Stop tracking which angle is being dragged
  draggingWhat = DRAG_NOTHING;
}

boolean isMouseNearAngle(float angle) {
  float mouseAngle = getMouseAngle();

  // Near the discontinuity (0, TWO_PI) in the angular values
  if ( (mouseAngle < angleNear) && (angle > (TWO_PI - angleNear)) ) {
    return true;
  }
  
  float angleDiff = mouseAngle - angle;
  return abs(angleDiff) < angleNear;
}

boolean isMouseNearControlPoint() {
  return abs(tension - mouseToCenter) < controlPointNear;
}

boolean isMouseInCircle(float distFromCenter) {
  return (distFromCenter < radius);
}

/**
 * Return the angle (in radians) of the mouse point relative to
 * the center of the chart.  Angles start clockwise from the
   * positive X axis.
 */
float getMouseAngle() {
  float distFromCenter = dist(xCenter, yCenter, mouseX, mouseY);
  // if ( ! isMouseInCircle(distFromCenter) ) return -1.0;

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



