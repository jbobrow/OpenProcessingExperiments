
// functions:
// creating custom "commands" that can be reused

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(33);
  drawTarget(50, 250, 950, 22);
  drawTarget(100, 100, 200, 8);
  drawTarget(mouseX, mouseY, 250, 12);
  drawTarget(300, 300, 350, 7);
}

// the function syntax:
// returnType functionName ( parameters ) {
//    do some stuff
//    (sometimes return something, depends on returnType)
// }
void drawTarget(int x, int y, int radius, int bands) {
  noStroke();
  // count down loop
  for (int i=bands; i > 0; i--) {
    // every other band will be either black or white 
    // this works because the reminder of any even number divided 
    // by 2 is always 0! (and odd numbers have a reminder of 1)
    if (i % 2 == 0) {
      fill(0);  
    }
    else {
      fill(255);  
    }
    // calculate the radius for each band based on the total radius 
    float r = map(i, 0, bands, 0, radius);
    ellipse(x, y, r, r);
  }
}
