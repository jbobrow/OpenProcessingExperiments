
void setup() {
  size(400,400);
  noStroke();
}
void draw() {
  background(9);
  int stepsize = 20;
  float effect =2000.0;
  for (int i=stepsize; i < width; i += stepsize) {
    for (int j=stepsize; j < height; j += stepsize) {
      float distance = sqrt(pow(i - mouseX,2)+pow(j-mouseY,2));
      float radius = distance*distance/effect;
      radius = min(stepsize,radius);
      ellipse(i,j,radius,radius);
    }
  }
}



