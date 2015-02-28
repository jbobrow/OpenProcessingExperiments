
void setup() {
  size(250, 250);
  background(255);
  smooth();
  noLoop(); //by default does not loop
}

float x = 0;
float y = 0;

void draw() {
  x = x + 1; //moves lines across screen horizontally by 1
  y = random(0,250); //height of lines is random amount less than 250
  if (x > width) { //looops whe x is off screen; goes back to 0
    x = 0;
  }
  strokeWeight(4); //lines of 4 stroke and random colours
  stroke(color(random(255),random(255),random(255),random(255)));
  line(x, 255, x, y); //lines all start at bottom of screen
}

void mousePressed() { //if mouse pressed loop
  loop();
}

void mouseReleased() { //if mouse not pressed, stops moving
  noLoop();
}

