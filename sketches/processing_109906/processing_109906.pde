
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
 noLoop();
}

// Draw

void draw() {
  // for statement
  for ( int x = 25;  x < width; x += 50) {
    for (int y = 25; y < height; y += 50){
 float r = random(1,5);
 strokeWeight(10);
 stroke(palette[int(r)]);
 noFill();
 ellipse(x, y, 40, 40);
    }
 }

}
