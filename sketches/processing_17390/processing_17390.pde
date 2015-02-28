
class Circle {
  float x, y; // X-coordinate, y-coordinate
  float r; // variables for colors
  float g;
  float b;

  float diameter; // Diameter of the ring
  boolean on = false; // display on and off when mouse pressed

  void start(float xpos, float ypos) {

    x = xpos;
    y = ypos;
    on = true;
    diameter = 1;
  }
 
  void grow() {
    if (on == true) {
      diameter += 1; // when mouse pressed grow 1
      if (diameter > 300) { // stop growing at 300
        on = false;
      }
    }
  }

  void display() {
     r = random(255); //initialize colors
     g = random(255);
     b = random(255);
     
    if (on == true) {
      stroke(r,g,b,50);
      strokeWeight(10);
      //stroke(random(0,255));
      ellipse(x, y, diameter, diameter);
    }
  }
}


