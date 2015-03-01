
ArrayList<Circle> circles = new ArrayList<Circle>();

int min = 2;
int max = 150;

/* Our object */
Circle c = new Circle(new PVector(0, 0), 20);

void setup() {
  size(640, 640);
  circles.add(c);
  /* Because we are not refreshing the draw screen. We set what the background wil be a the  */
  background(0);
}

void draw() {
  c.draw();
  /* Make a random location and diameter */
  PVector newLoc = new PVector(random(width), random(height));
  int newD = (int) random(min, max);
  /* Detect whether if we use these these values if it will intersect the other objects. */
  while (detectAnyCollision (circles, newLoc, newD)) {
    /* If the values do interect make new values. */
    newLoc = new PVector(random(width), random(height));
    newD = (int) random(min, max);
  }

  /* Once we have our values that do not intersect, add a circle. */
  c = new Circle(newLoc, newD);
  circles.add(c);
  
  /* You can add an "if" statement to prevent the simulation going on forever */
}

static boolean detectAnyCollision(ArrayList<Circle> circles, PVector newLoc, int newR) {
  for (Circle c : circles) {
    if (c.detectCollision(newLoc, newR)) {
      return true;
    }
  }
  return false;
}


class Circle {
  PVector loc;
  int d;

  Circle(PVector loc, int d) {
    this.loc = loc;
    this.d = d;
  } 

  void draw() {
    /* Random color to add some spice */
    fill(random(255), 0, random(255));
    ellipse(loc.x, loc.y, d, d);
  }

  boolean detectCollision(PVector newLoc, int newD) {
    /* 
     We must divide d + newD because they are both diameters. We want to find what both radius's values are added on. 
     However without it gives the balls a cool forcefeild type gap.
     */
    return dist(loc.x, loc.y, newLoc.x, newLoc.y) < ((d + newD)/2);
  }
}



