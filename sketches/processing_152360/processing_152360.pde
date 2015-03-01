
float[] x;   // current drawing position
float[] y;   // current drawing position
float[] dx;  // change in position at each frame
float[] dy;  // change in position at each frame
float rad;   // radius for the moving hand
int sze=30;

void setup() {
 size(500, 500);
 x = new float[sze];        //fix size of arrays
 y = new float[sze];
 dx = new float[sze];
 dy = new float[sze];
 for (int i=0; i<sze; i++) {//initialise arrays
  x[i] = width/2; //center
  y[i] = height/2;
  dx[i] = random(-1, 1);    // small change in position each frame
  dy[i] = random(-1, 1);
 }
 background(0);
}
 
void draw() {
 //blendMode(BLEND);
 fill(0, 5);
 rect(0, 0, width, height);
 for (int i=0; i<sze; i++) {
  rad = radians(frameCount);
  x[i] += dx[i];   // calculate new position
  y[i] += dy[i];
  float max = 1;
  float min = 0.5;
  if (x[i] > width-100 || x[i] < 100) { //if hit edge reverse dir and change speed
   dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
  }
  if (y[i] > height-100 || y[i] < 100) {
   dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
  }
  float bx = x[i] + 100 * sin(rad);
  float by = y[i] + 100 * cos(rad);
  fill(180);
  float radius = 100 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3);
  float handY = by + radius * cos(rad*3);
  stroke(255, 50);
  line(bx, by, handX, handY);
  ellipse(handX, handY, 2, 2);
 }
}

