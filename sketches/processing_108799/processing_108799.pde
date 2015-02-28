
/**
 * Perspective vs. Ortho
 *
 * Move the mouse left to right to change the "far" 
 * parameter for the perspective() and ortho() functions.
 * This parameter sets the maximum distance from the 
 * origin away from the viewer and will clip the geometry.
 * Click a mouse button to switch between the perspective and
 * orthographic projections.
 */


boolean showPerspective = false;

void setup() {
  size(500, 360, P3D);
  noFill();
  fill(255);
  noStroke();
}

void draw() {
  lights();
  background(0);
  float far = map(mouseX, 0, width, 420, 200);
  if (showPerspective == true) {
    perspective(PI/3.0, float(width)/float(height), 10, far);
  } else {
    ortho(0, width, 0, height, 10, far);
  }
  translate(width/4, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/6);
  box(120);
}

void mousePressed() {
  showPerspective = !showPerspective;
}



