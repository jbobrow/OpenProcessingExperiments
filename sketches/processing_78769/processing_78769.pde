
float spin = 0.0;

void setup() {
  size(1000, 1000, P3D);
  noStroke();
}

void draw() {
  background(51);
  
  if (!mousePressed) {
    lights ();
  }
  
   if (mousePressed) {
     stop
  
  spin += 0.08;
  
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(PI/1);
  rotateY(PI/9 + spin);
  box(50);
  popMatrix();
}
