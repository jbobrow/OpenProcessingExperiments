
int frame = 0;
int elements = 10000;
float x[] = new float[elements];
float y[] = new float[elements];
int numpoints = 0;

void setup(){
  size(600,600);
  noStroke();
}

void mouseDragged() {
  // add a point to the array:
  x[numpoints] = mouseX;
  y[numpoints] = mouseY;
  // increase the number of points added:
  numpoints += 1;
}

void draw() {
  background(201, 245, 255, 0);
    fill(165,238,75);
  rect(0, 500, 600, 100);
  for (int i = 1; i < numpoints; i++) {
      x[i] += random(-1, 1);
      y[i] += random(-1, 1);
      int size = (frame + i) % 20;
      fill(255,115,random(0,184), random(1, 200));
      ellipse(x[i], y[i], size, size + 10);
    
    float phase = frame / i;
    // move this point:
   // x[i] += phase;
    y[i] += phase % 10;
    
  }
  frame += 1;  
}
