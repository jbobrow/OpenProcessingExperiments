
// Tap the canvas, and hit some keys!

int avst = 1; // Vertikal avstand
int randomfaktor = 50; // Hvor mange piksler med randomhet
int min = 100; // Minimum random RGB value
int max = 230; // Maximum random RGB value

void setup() {
  size(800, 600);
  background(random(min, max), random(min, max), random(min, max));
  noLoop();
}

void draw() {
  float ant = width/avst;
  for (int i = 0; i<=ant; i+=avst) {
    float randx = random((width/2)-randomfaktor, (width/2)+randomfaktor);
    rectMode(CENTER);
    fill(random(min, max), random(min, max), random(min, max));
    rect(randx, i*10, width/2, 5);
  }
}

void keyPressed() {
  background(random(min, max), random(min, max), random(min, max));
  redraw();

}
