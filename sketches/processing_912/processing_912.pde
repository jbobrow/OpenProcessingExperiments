
// Deniz Mutlu 050411042 Grafik Tasarım
// Birleşıkken başka sekıl oluşturan 2ayrıldıgında 
// ıkısıde ayrı hareket edebılen yuvarlaklar .


float x = 250;
float y = 50;
float angle1 = 0.0;
float segLength = 10;

void setup() {
  size(800, 500);
  smooth(); 
  strokeWeight(400);
  stroke(250, 100);
}

void draw() {
  background(1000);
  
  float dx = mouseX - y;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
 
  segment(x, y, angle1); 
  ellipse(x, y, 200, 100);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, x);
  rotate(a);
  line(0, 5, segLength, 0);
  popMatrix();
}


