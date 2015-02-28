
//6.1) Create a 300x300px sketch that uses an array to manage at least 20 variables in a composition. If pressed for ideas, you may extend an older sketch by modifying it to use arrays.
//Graduate Challenge: Use two arrays (or more) to manage at least 100 variables.

color[] colorPalette = new color[4]; //declare and create the array color palette

void setup() {
  size(300, 300);
  background(255);
  smooth();

  //load colors into the array
  colorPalette[0] = color(255, 206, 5, 75);
  colorPalette[1] = color(255, 206, 5);
  colorPalette[2] = color(35, 1, 139);
  colorPalette[3] = color(20, 0, 80);
}


int count = 0; // this makes i and j loops reset so that they move across, down one and across, etc..

void draw() {
}


void mousePressed() {
  for (int i=0; i < height; i = i + height/4) {
    pushMatrix();

    for (int j=0; j < width; j = j + width/4) {
      if (count % 2 ==0) { // this modulo test says that every even area is assigned vertical lines
        for (int x=0; x < width/4; x++) {
          stroke(pickAColor());
          strokeWeight(random(1, 5));
          line(0, x, width/4, x);
        }
      }
      else {
        for (int x=0; x < width/4; x++) {
          stroke(pickAColor());
          strokeWeight(random(1, 5));
          line(x, 0, x, width/4);
        }
      }
      count++;
      translate(width/4, 0); // moves the line loop across
    }
    count++;
    popMatrix();
    translate(0, height/4); // moves the line loop down
  }
}
color pickAColor() { //helper function picks a random color from the array
  int c = int(random(4)); // random number from 0-3
  return colorPalette[c];
}


