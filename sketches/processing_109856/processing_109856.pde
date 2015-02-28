
//Code blokcs, arrays, and Color palettes
// Global variables
color darkBrown = #502020;
color[] palette = { #D5A400, #7F6200, #FFC400, #403100, #E5B000};
float x;

//Setup()

void setup() {
//size and background color
size(800, 600);
// Local variable
background(palette[1]);
}


//draw()

void draw() {
  x+=32;
  float r = random(5);
 // elements to be drawn to the canvas
 noFill();
 strokeWeight(random(20));
 stroke(palette[int(r)]);
 rect(x, random(height), random(250), random(250));
 println(x);
 x = constrain(x, 0, width+250);
}
