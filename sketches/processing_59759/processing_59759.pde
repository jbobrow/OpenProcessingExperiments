
/** BezierTangentDemo allows to experiment with the bezierTangent-function of processing<br />
 * Keys: '1' - '0' - set the number of curve segments between 1 and 10<br />
 * Klick the points with the mouse to activate and change their position<br />
 */

// define 4 points
float px1 = 40;
float px2 = 200;
float px3 = 360;
float px4 = 460;
float py1 = 450;
float py2 = 40;
float py3 = 300;
float py4 = 40;

// point radius
float pt_radius = 5;

// default interpolation steps
int steps = 2;

// booleans for editing purposes
boolean pt1_active = false;
boolean pt2_active = false;
boolean pt3_active = false;
boolean pt4_active = false;

void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  background(255);
  stroke(200);
  strokeWeight(5);
  
  // check active points for editing
  if (pt1_active) {
    px1 = mouseX;
    py1 = mouseY;
  }
  else if (pt2_active) {
    px2 = mouseX;
    py2 = mouseY;
  }
  else if (pt3_active) {
    px3 = mouseX;
    py3 = mouseY;
  }
  else if (pt4_active) {
    px4 = mouseX;
    py4 = mouseY;
  }
  
  // draw bezier curve
  noFill();
  bezier(px1, py1, px2, py2, px3, py3, px4, py4);
  
  // draw lines to control points
  strokeWeight(1);
  stroke(51, 153, 255);
  line(px1, py1, px2, py2);
  line(px3, py3, px4, py4);
  stroke(0);
  
  // fill active points accordingly to their activation status
  if (pt1_active) {
    fill(255, 0, 0);
  }
  else {
    fill(255, 160, 0);
  }
  ellipse(px1, py1, 2*pt_radius, 2*pt_radius);
  if (pt2_active) {
    fill(255, 0, 0);
  }
  else {
    fill(255, 160, 0);
  }
  ellipse(px2, py2, 2*pt_radius, 2*pt_radius);
  if (pt3_active) {
    fill(255, 0, 0);
  }
  else {
    fill(255, 160, 0);
  }
  ellipse(px3, py3, 2*pt_radius, 2*pt_radius);
  if (pt4_active) {
    fill(255, 0, 0);
  }
  else {
    fill(255, 160, 0);
  }
  ellipse(px4, py4, 2*pt_radius, 2*pt_radius);
  
  // interpolate and draw tangents and tangent points
  fill(255);
  for (int i = 0; i <= steps; i++) {
    float t = i / float(steps);
    // Get the location of the point
    float x = bezierPoint(px1, px2, px3, px4, t);
    float y = bezierPoint(py1, py2, py3, py4, t);
    // Get the tangent points
    float tx = bezierTangent(px1, px2, px3, px4, t);
    float ty = bezierTangent(py1, py2, py3, py4, t);
    
    // Calculate an angle from the tangent points
    float a = atan2(ty, tx);
    a += PI;
    
    // draw one tangent line
    stroke(160, 80, 0);
    line(x, y, cos(a)*30 + x, sin(a)*30 + y);
    
    // draw the other tangent line
    line(x, y, cos(a)*-30 + x, sin(a)*-30 + y);
    stroke(0);
    
    // draw tangent point
    ellipse(x, y, 5, 5);
  }
}

void mouseReleased() {
  if ((mouseX > px1-pt_radius)&&(mouseX < px1+pt_radius)&&(mouseY > py1-pt_radius)&&(mouseY < py1+pt_radius)) {
    pt1_active = !pt1_active;
    println("Point 1 klicked active = " + pt1_active);
    if (pt1_active) {
      pt2_active = false;
      pt3_active = false;
      pt4_active = false;
    }
  }
  else if ((mouseX > px2-pt_radius)&&(mouseX < px2+pt_radius)&&(mouseY > py2-pt_radius)&&(mouseY < py2+pt_radius)) {
    pt2_active = !pt2_active;
    println("Point 2 klicked active = " + pt2_active);
    if (pt2_active) {
      pt1_active = false;
      pt3_active = false;
      pt4_active = false;
    }
  }
  else if ((mouseX > px3-pt_radius)&&(mouseX < px3+pt_radius)&&(mouseY > py3-pt_radius)&&(mouseY < py3+pt_radius)) {
    pt3_active = !pt3_active;
    println("Point 3 klicked active = " + pt3_active);
    if (pt3_active) {
      pt2_active = false;
      pt1_active = false;
      pt4_active = false;
    }
  }
  else if ((mouseX > px4-pt_radius)&&(mouseX < px4+pt_radius)&&(mouseY > py4-pt_radius)&&(mouseY < py4+pt_radius)) {
    pt4_active = !pt4_active;
    println("Point 4 klicked active = " + pt4_active);
    if (pt4_active) {
      pt2_active = false;
      pt3_active = false;
      pt1_active = false;
    }
  }
}

void keyReleased() {
  switch(key) {
  case '1':
    steps = 1;
    break;
  case '2':
    steps = 2;
    break;
  case '3':
    steps = 3;
    break;
  case '4':
    steps = 4;
    break;
  case '5':
    steps = 5;
    break;
  case '6':
    steps = 6;
    break;
  case '7':
    steps = 7;
    break;
  case '8':
    steps = 8;
    break;
  case '9':
    steps = 9;
    break;
  case '0':
    steps = 10;
    break;
  case 's':
    saveFrame("BezierTangentDemo_##.png");
    break;
  }
}


