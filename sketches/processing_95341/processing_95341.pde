
int numpoints = 0;
int elements = 1000;
int frame = 0;
float x[] = new float[elements];
float y[] = new float[elements];

// the number of drawn points added to the array
// (initially zero, until drawing begins):
void setup(){
 
     size (600, 600);
  
}

void mouseDragged() {
    // add a point to the array:
    x[numpoints] = mouseX;
    y[numpoints] = mouseY;
    // increase the number of points added:
    numpoints += 1;
}
void draw() {
  background(200);
  for (int i = 1; i < numpoints; i++) {
    float phase = frame / i;
    // move this point:
    x[i] += sin(phase);
    y[i] += cos(phase);
    // use this to set the color:
    stroke((frame + i) % 256);
    // draw line from previous point to current point:
    
    //line(x[i-1], y[i-1], x[i], y[i]);
    fill(200);
    curve(x[i], y[i], x[i-1], y[i-1], x[i-2], y[i-2], x[i-3], y[i-3]);
    
  }
  // increase the current frame:
  frame += 1;
}
