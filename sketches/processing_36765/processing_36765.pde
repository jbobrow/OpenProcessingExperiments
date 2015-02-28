
//This program draws 5 sections of partially transparent rectangles on top of each other to form a composition.
void setup() {
  size(500, 300);
  smooth();
  background(0);
  frameRate(5); //slows the speed of the rectangles being drawn
}

float count = 0; //zeros the counter
float num = 500; //controls the number of rectangles

int numOfRect =500;

void draw() {
  if (numOfRect>0) {
    if (count<num) {
      stroke(255, 50);
      strokeWeight(5);
      fill (255, 255, 255, 15);
      rect (0, 0, 100, random(300)); //Makes the first vertical bar of white rectangles
    }

    if (count<num) {
      fill (255, 0, 0, 15);
      rect (100,0, 100, random(height)); //Makes the second vertical bar of red rectangles
    }

    if (count<num) {
      fill (255, 240, 0, 15);
      rect (400, 0, 100, random(height)); //Makes the third vertical bar of blue rectangles
    }

    if (count<num) {
      fill (0, 50, 255, 15);
      rect (200, 0, 100, random(height)); //Makes the fourth vertical bar of white rectangles
    }

    if (count<num) {
      fill (255, 255, 255, 15);
      rect (300, 0, 100, random(height)); //Makes the fifth vertical bar of yellow rectangles
    }
  }
  count++;
}


