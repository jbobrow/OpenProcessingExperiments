
float aumento=0;
void setup() {
   frameRate(3000000);
  size (600,600);
  background (240);
  float r = random(255);
}
void draw() {
  fill (random (50));
  ellipse (random(width), random(height),aumento, aumento);
  aumento =+ 0.3;
}

