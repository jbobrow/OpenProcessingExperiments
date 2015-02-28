
int f = 30;
int bgColor = 0; 
int opacMin = 30;
int opacMax = 255;
int imax = 10;
float d = 600.0;
float kideal = 0.052387;
float deltapi = 0.05;
float theta;
float ch, cs, cb;
float cx, cy, r, h;
PVector M0, M1, M2, M3;
 
void setup() {
  size(800, 800, JAVA2D);
  //colorMode(HSB, 2*PI, 100, 100); doesn't work with processing.js
 
  ch = 0.0;
  cs = 100.0;
  cb = 100.0;
  r = d/2.0;
  cx = width/2.0;
  cy = height/2.0;
  h = sqrt(pow(width,2) + pow(height,2));
  M0 = new PVector(0.0, 0.0, 0.0);
  M1 = new PVector(0.0, 0.0, 0.0);
  M2 = new PVector(0.0, 0.0, 0.0);
  M3 = new PVector(0.0, 0.0, 0.0);
  theta = (float )deltapi*PI;   
  frameRate(f);
}
 
void draw() {
 
  int i, j;
 
  initBg();
  M0.set(cx - r, cy, 0.0);
  initVectors(theta, kideal, 0);
   
  ch = atan2(mouseY - cx, mouseX - cy) + PI;
  cs = map(sqrt(pow(mouseX - cx,2) + pow(mouseY - cy,2)), 0, h/2.0, 100, 0);
 
  //println("hue="+ch+" sat="+cs+" bri="+cb);
 
  for (i = 0; i < imax; i++) {
    //index => % opacity
    float opacity = map(i, 0, imax - 1, opacMin, opacMax);     
    stroke(ch, cs, cb, opacity);
    //strokeWeight(0);
    fill(ch, cs, cb, opacity);
    for (j = 0; j < 4; j++) {
      pushMatrix();
      translate(2.0*((int )((j + 1)/2) - 2*(int )((j + 1)/4))*cx, 2.0*(int )(j/2)*cy);
      rotate((float )j*HALF_PI);
      drawShape();
      popMatrix();
    }
    rotateVector(M0, theta);
    rotateVector(M1, theta);
    rotateVector(M2, theta);
    rotateVector(M3, theta);
  }
}
 
void initBg() {
  background(bgColor);
  smooth();
}
 
void drawShape() {
  //println("M0: " + M0);
  beginShape();
  vertex(
    M0.x, M0.y);
  bezierVertex(
    M1.x, M1.y,
    M2.x, M2.y,
    M3.x, M3.y);
  vertex(
    2*cx - M3.x, M3.y);
  bezierVertex(
    2*cx - M2.x, M2.y,
    2*cx - M1.x, M1.y,
    2*cx - M0.x, M0.y);
  vertex(
    M0.x, M0.y);
  endShape();
}
 
void initVectors(float t, float ki, int n) {
  /*
    Simulation d'un arc de cercle par une courbe de Bézier
    http://d.krauss.free.fr/documents/Transverses/Bezier/Arc_cercle/Arc_Cercle.htm
  */
  float a = (float )pow(-1, n)*t;
  M1.set(
    M0.x - n*ki*r,
    M0.y - (1 - n)*ki*r,
    0.0);
  //println("M1: " + M1);
  M2.set(
    (M0.x + n*ki*r - cx)*(float )Math.cos(a) - (M0.y + (1 - n)*ki*r - cy)*(float )Math.sin(a) + cx,
    (M0.x + n*ki*r - cx)*(float )Math.sin(a) + (M0.y + (1 - n)*ki*r - cy)*(float )Math.cos(a) + cy,
    0.0);
  //println("M2: " + M2);
  M3.set(
    (M0.x - cx)*(float )Math.cos(a) - (M0.y - cy)*(float )Math.sin(a) + cx,
    (M0.x - cx)*(float )Math.sin(a) + (M0.y - cy)*(float )Math.cos(a) + cy,
    0.0);
  //println("M3: " + M3);
}
 
void rotateVector(PVector M, float t) {
  float x = M.x;
  float y = M.y;
  M.x = (x - cx)*(float )Math.cos(t) - (y - cy)*(float )Math.sin(t) + cx;
  M.y = (x - cx)*(float )Math.sin(t) + (y - cy)*(float )Math.cos(t) + cy;
  //println("M: " + M);
}



