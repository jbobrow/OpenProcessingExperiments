
void setup() {
  size(170, 130);
  colorMode(HSB);
  noStroke();
}
void draw() {
  background(255);

  for (int i = 600 ; i > 0 ; i=i-15) {
    fill(i/3, 200, 200);
    float desviacion = (mouseX-(width/1))*0.001;
    rect((width/2)+(desviacion*i), height/2, i, i);
  }
}

