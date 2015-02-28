
float[] x;
float[] y;
float s = 32;
boolean stopped = false;

void setup() {
  size(500, 500,P3D);
  x = new float[s];
  y = new float[s];
  fill(#ccff00);
  noStroke();
} 

void draw() {
  background(#330000);
  lights();
  smooth();  
  if (!stopped) {
    x[0]=mouseX;
    y[0]=mouseY;
  }
  for(int i=(int)s-2; i>-1; i--) { 
    dragSegment(i+1, x[i], y[i]);
  }
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  float si = s-i;
  x[i] = xin - cos(angle) * (si);
  y[i] = yin - sin(angle) * (si);
  segment(x[i], y[i], angle,si);
}

void segment(float x, float y, float a, float r) {
  pushMatrix();
  translate(x,y);
  rotate(a);
  sphere(r);
  popMatrix();
}

void mousePressed() {
  stopped = !stopped; // toggle
}

void keyPressed() {
  switch(key) {
  case 's':
    save("greenworm"+str((int)millis())+".jpg");
    break;
  default:
    println("unknown key"); 
    break;
  }
}


