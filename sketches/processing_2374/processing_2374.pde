
Butterfly[] butterflies = new Butterfly[25];
float noiseValue = 0.005;

void setup() {
  size(800,600,P3D);
  for (int i = 0; i<butterflies.length; i++) {
    butterflies[i] = new Butterfly(random(width),random(height),random(height));
  }
}
void draw() {
  background(255);
  for (int i = 0; i<butterflies.length; i++) {
    butterflies[i].move();
    butterflies[i].display();
  }
}


