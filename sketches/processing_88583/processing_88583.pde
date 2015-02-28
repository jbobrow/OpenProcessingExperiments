
/* CLASS NOTES
if (mousePressed && mouseButton == LEFT)
if (mousePressed) {
  if (mouseButton == LEFT) {

  }
}
// mouse position variables
mouseX
mouseY


void draw() {
  stroke(100);
  strokeWeight(20);
  line(0, 5, 60, 65);
  line(60, 5, 0, 65);
}

fill(255);
fill(255, 0, 0);
int whatColorIDid = fill(255);
int six = multiply(2, 3);
int product = 2 * 3;
six = product;

int multiply(int a, int b) {
  int product = a * b;
  return product;
  product = 3;
}

int fill(int gray) {
  fill(255, 255, 255);
  return gray;
}

// PROCESSING BEHIND THE SCENES
setup();
while(IMRUNNINGGUYS) {
  if ( deltaTime > 1/ 60) {
    draw();
    mousePressed();
  }
}

*/

float timer = 0.2;
int drip = 0;
float dripX = 0;
float dripY = 0;
float gray = 0;

void setup() {
  size(600, 600);
  /*
  drawX(255, 0, 0, 20); 
  drawX(0, 30, 30, 20); 

  for (int i = 0; i < 100; i++) {
    drawX(randomThrees(), random(0, width), random(0, height), random(0, 5));
  }*/
}

void draw() {
  timer += 0.0167;
  drip += 1;
  
  if (mousePressed && mouseButton == LEFT && timer > 0.4) {
    gray = random(0, 255);
    drawX(gray, mouseX, mouseY, random(0, 5));
    timer = 0;
    
    // reset drip
    drip = 0;
  }
  
  // drip for half a second
  if (timer < 0.4) {
    if (drip < 50) {
      stroke(gray, 200 - (drip * 10));
      strokeCap(SQUARE);
      float nextY = dripY + (drip * drip) * 0.15; // drip squared to better emulate gravity
      line(dripX, dripY, dripX, nextY);
      dripY = nextY + 1; // + 1 so they don't overlap
    }
  }
}

void drawX(float graycolor, float x, float y, float weight) {
  stroke(graycolor);
  strokeWeight(weight);
  line(x, y + 5, x + 60, y + 65);
  line(x + 60, y + 5, x, y + 65);
  
  // set drip start to be same place as end of x
  dripX = x + 60;
  dripY = y + 65;
}

float randomThrees() {
  float threes = random(0, 255);
  threes = threes + (threes % 3);
  return threes;
}
