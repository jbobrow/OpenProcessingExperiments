
void setup() {
  size (1000, 1000);
  background(#FAF5E8);
  colorMode(HSB, 360, 100, 100);
}

void draw() {

  int space = 50;  
  int a = int(random(19));
  int b = int(random(25));

  //this for loop draws ellipses across the x-axis before jumping to the next y-axis
  for (int y = 0; y < 25; y++) {

    for (int x = 0; x < 20; x++) {

      noStroke();

      //designating black to random rows and columns
      if ((x == a) || (y == b)) {
        fill(0, 0, 0);
      }

      //designating a random color to the remainder of the program each time it is run
      else {
        fill (random(360), 100, 100);
      }

      //circles are drawn with a space of 50 above and below them
      ellipse(x*space + 20, y*space + 20, 20, 20);
    }
  }

  save("randomcross.jpg");
  stop();
}



