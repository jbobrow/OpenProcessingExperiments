
void setup() {
  size(800, 800);
  background(255);
}
void draw() {
  float a= random(800);
  float b= random(800);
  float t= 0.05;

  for (int p=0;p<400;p++) {
    stroke(a/3, b/3, 255);
    strokeWeight(t);
    line( width/2, height/2, a, b);
  }
}



