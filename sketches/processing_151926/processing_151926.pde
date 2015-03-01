
int count= 10;
float easing= 0.009;
float k= 0;
float c= 0;
float cc= 1;
void setup() {
  size(800, 600, OPENGL);
  colorMode(HSB);
  noStroke();
  smooth();
}
void draw() {
  background(255);
  translate(width/2-40, height/2, 0);
  k+=mouseX*easing;
  c+=mouseX*easing*cc;
  if (c>mouseX) {
    cc=-1;
  }
  if (c<1) {
    cc=1;
  }
  for (int i= 1; i<=count; i++) {  
    fill(degrees(PI*c/width/2+PI/40*i), 170, 250);
    rotateX(PI/5*k/width);
    rotateY(-PI/5*k/width);
    rotateZ(PI/15*k/width);
    ellipse(150, 0, 150, 150);
  }
}
