
void setup() {
  size(600, 600);
  colorMode(HSB);
  noStroke();
}
void draw() {
  background(255);

  for (int i = 600 ; i > 0 ; i=i-15) {
    fill(i/3, 200, 200);
    float desviacion = (mouseX-(width/2))*0.001;
    ellipse((width/2)+(desviacion*i), height/2, i, i);
  }
}

