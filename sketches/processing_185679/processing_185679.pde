
void setup() {
  size(600, 600);
  colorMode(HSB);
    background(random(255),100,255,50);
}
void draw() {
  float aleatorio = random(0, 255);
  float x=random(0, width);
  float y=random(0, height);
  for (int i =700; i>0; i--) {

    stroke(0);
    fill(aleatorio, i, i);
    point((aleatorio)+(mouseY/3), 255);
    rotate(i);
  }
}
