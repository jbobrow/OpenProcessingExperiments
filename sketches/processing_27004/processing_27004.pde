
/* Simple (I love simple) example of a series of spheres,
 where the radius will shrink the closer you get to the cursor. */
void setup() {
  size(400,400);
  noStroke();
}
void draw() {
  background(0);
  int stepsize = 40;
  float effect = 500.0;
  for (int i=stepsize; i < width; i += stepsize) {
    for (int j=stepsize; j < height; j += stepsize) {
      float distance = sqrt(pow(i - mouseX,2)+pow(j-mouseY,2));
      float radius = distance*distance/effect;
      radius = min(stepsize,radius);
      ellipse(i,j,radius,radius);
    }
  }
}
