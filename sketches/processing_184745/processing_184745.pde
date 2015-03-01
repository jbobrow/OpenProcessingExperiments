
/* Simple Mountains
 * http://www.openprocessing.org/user/45793
 * Nellie Robinson (narobins) */

float[] pts;
int n;
int len;
float roughness;
int num_layers = 7;

void setup() {
  size(800, 200);
  n = 7;
  len = int(pow(2, n));
  noLoop();
  noStroke();
}

float calcError(float n) {
 return random(-roughness, roughness) * n; 
}

void draw() {
  background(255);
  roughness = 0.01;
  pts = new float[len + 1];
  for (int i = num_layers; i > 0; i--) {
    pts[0] = (height - 100)/pow(2, i) + 50;
    pts[len] = (height - 100)/pow(2, i) + 50;
    fill(60 * i);
    fillarray();
    display();
    roughness *= 2;
  }
}

void fillarray() {
  for (int i = 0; i < n; i++) {
    int inc = len / int(pow(2, i));
    int start = 0;
    int next = start + inc;
    
    while(next <= len) {
      pts[(start + next) / 2] = calcError(inc) + (pts[start] + pts[next]) / 2;
      start = next;
      next += inc;
    }
  }
}

//draws layers back to front
void display() {
  float inc = width/float(len);
  beginShape();
  vertex(0, pts[0]);
  for (int i = 0; i < len + 1; i++) {
    curveVertex(i*inc, pts[i]);
  } 
  vertex(width, pts[len]);
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}

void keyPressed() {
  redraw();
}
