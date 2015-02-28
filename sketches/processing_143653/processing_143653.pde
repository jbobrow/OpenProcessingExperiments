

  // Konkuk University
  // Department of Dynamic Media
  // SOS iDesign
  // Name: KIM Hyun Gi!
  // ID: hyungi216
void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  for (int i=3; i<width; i+=40) {
    for (int j=3; j<height; j+=40) {
      strokeWeight(20);
      rectMode(CENTER);
      rect(i, j, 0, 0);

      noFill();
      stroke(255);
      strokeWeight(5);
      rect(i, j, 100, 100);
    }
  }
}
