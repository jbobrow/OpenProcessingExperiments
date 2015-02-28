
/*
 Simple rings made out of rectangles.
 A better idea would be using a PShape and adding vertices.
 I wonder if that can also be done with translate() and rotate()...
 */
void setup() {
  size(400, 400, P3D);
  noStroke();
  colorMode(HSB);
  rectMode(CENTER);
  ortho(-width/2, width/2, -height/2, height/2, 1, 400);
  background(0);
  ring(width/2-50, height/2-40, 0, 100, 50, #FFFF00, false);
  ring(width/2+50, height/2-40, 1, 100, 50, #FF00FF, false);
  ring(width/2, height/2+45, 0.5, 100, 50, #00FFFF, true);
}
void ring(float x, float y, float z, float radius, float sz, int c, boolean zosc) {
  int steps = (int)radius/2;
  for (int i=0; i<steps; i++) {
    pushMatrix();
    if (zosc) {
      // z oscillation. Move forward and back to achieve trick. 
      translate(x, y, z + ((i/int(steps/5.5)) % 2 < 1 ? 2 : -2));
      rotateZ((i+11)*TWO_PI/steps);
    } 
    else {
      translate(x, y, z);
      rotateZ(i*TWO_PI/steps);
    }
    fill(c);
    rect(radius, 0, sz, steps*0.33);
    popMatrix();
  }
}

