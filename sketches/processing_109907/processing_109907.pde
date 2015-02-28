
//Code blokcs, arrays, and Color palettes
// Global variables
// Working with if, for, and while

// Global Variables

float x = 25;
float y = 25;
float counter = 0;
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
// while statement
 while(counter < 100) {
 float r = random(1,5);
 strokeWeight(random(10));
 stroke(palette[int(r)]);
 noFill();
 x = random(width);
 y = random(height);
 float d = random(200);
 ellipse(x, y, 40, 40);
 counter++;
 }

}
