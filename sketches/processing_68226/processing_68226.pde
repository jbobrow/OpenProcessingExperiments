
int cs = 20;  // Cell size
float t = 0;    // Time variable.

void setup() {
  size(400, 400);
  background(0);
  smooth();
}

void draw() {
  // Double iterations. Treat j as y, and i as x.
  for (int j = 0; j < height / cs; j++) {
    for (int i = 0; i < width / cs; i++) {

      // Use your imagination, and your math textbook from high school.
      if ( sin(i + t) + cos(j) <= 0 ) {  // Change the condition to make your own pattern.
        fill(255);
      }
      else {
        fill(50);
      }

      stroke(0);
      strokeWeight(2);
      ellipse(cs / 2 + i * cs, cs / 2 + j * cs, cs, cs);
    }
  }
  // Uncomment the following line to animate the graph.
  //t = t - 0.1;
}


