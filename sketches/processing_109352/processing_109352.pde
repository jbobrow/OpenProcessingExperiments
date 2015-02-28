
void setup() {
  size(1170, 700);
  background(255, 254, 242);
  smooth();
  noStroke();
  colorMode(HSB, 360, 100, 100);
  frameRate(1);
//CIRCZ LOOPZ
  for (int i = 35; i < width; i += 100) {
    for (int j = 50; j < height; j += 100) { 
      color rando = color(random(360), 80, 80);
      //BLACK CIRCZ
       if ((i == 135) || (j == 450)) {
        fill(0);
      }
      else {
        fill(rando);
      }
//CIRQ
      ellipse(i, j, 75, 75);
    }
  }
}
