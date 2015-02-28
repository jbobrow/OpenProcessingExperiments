
//Code blokcs, arrays, and Color palettes
// Global variables
// Working with if, for, and while

// Global Variables

int x = 25;
int y = 25;
color[] palette =
{ #D5A400, #7F6200, #FFC400, #403100, #E5B000};


// Setup()

void setup() {
 size(800, 600);
 background(palette[0]);
}

// Draw

void draw() {
 float r = random(1,5);
 strokeWeight(10);
 stroke(palette[int(r)]);
 noFill();
 ellipse(x, y, 40, 40);
 if (x < width) {
 x += 50;
  if (x > width) {
   y += 50;
   x = 25;
  }
 }
}
