
float increment = 1; // Incrementor thingy
float speed = 0.02;

void setup() {
  size(600, 300);
  background(0);
  colorMode(HSB, 360, 100, 100);
}

void draw() {

  inc();

  /* 
  UNCOMMENT THESE TWO FOR MOUSE INTERACTION THAT DOESN'T WORK IN JAVASCRIPT MODE:
  */
  
  // int distance = (int) map(mouseX, 2, width, 20, 50);
  // float hueOne = map(mouseY, 0, height, -50, 220); // First colour

  /*
  COMMENT OUT THESE TWO IF YOU UNCOMMENTED THEIR MOUSE INTERACTION COUNTERPARTS ABOVE
  */
  println(sin(increment));
  int distance = (int) map(sin(increment), -1, 1, 20, 50);
  float hueOne = map(sin(increment), -1, 1, -50, 220);

  int size = width*2; // Circles' max size
  int diff = 150; // How different the colours should be (max 360)

  // Background grid
  for (int i = 0; i<=width; i+=distance) {
    for (int j = 0; j<=height; j+=distance) {
      float gradient = map(j, 0, width, hueOne, hueOne+diff);
      fill(gradient, 50, 100);
      stroke(0, 100, 0);
      rect(i, j, distance, distance);
    }
  }

  // Halftone dots
  for (int y = distance; y<height-distance; y+=distance) {
    float yhue = map(y, 0, height, hueOne, hueOne+diff);
    fill(yhue, 50, 100);
    for (int x = 0; x<width; x+=(distance*2)) {
      ellipse(x+y, y, y/10, y/10);
    }
  }
}

void inc() {
  increment+=speed;
}

