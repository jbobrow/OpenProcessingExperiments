
ArrayList<Circle> circles = new ArrayList<Circle>();

int num = 200;

int min = 5;
int max = 150;

/* Our object */
Circle c = new Circle(new PVector(random(width/2-num, width/2+num), random(height/2-num, height/2+num)), (int)random(min, max));

void setup() {
  size(640, 640);
  noStroke();
  circles.add(c);
}

void draw() {
  background(0);
  for(int i = 0; i < circles.size(); i++){
      Circle c = (Circle) circles.get(i);
      c.draw();
  }
  PVector newLoc = new PVector(random(width/2-num, width/2+num), random(height/2-num, height/2+num));
  int newD = (int) random(min, max);
  while (detectAnyCollision (circles, newLoc, newD)) {
    /* If the values do interect make new values. */
    newLoc = new PVector(random(width/2-num, width/2+num), random(height/2-num, height/2+num));
    newD = (int) random(min, max);
  }
  /* Once we have our values that do not intersect, add a circle. */
  if(circles.size() < 500){
    c = new Circle(newLoc, newD);
    circles.add(c);
  }

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
    float r = dist(loc.x, loc.y, width/2, height/2);
    float g = sin(radians(loc.x+frameCount)) * map(loc.x, 0, width, 0, 255);
    float b = cos(radians(loc.y+frameCount)) * map(loc.y, 0, height, 0, 255);
    fill(255, g, b);
    float angle = sin(radians(r+frameCount)) * d/3;
    //if (r < num) {
      ellipse(loc.x, loc.y, d/1.5+angle, d/1.5+angle);
    //}
  }

  boolean detectCollision(PVector newLoc, int newD) {
    /* 
     We must divide d + newD because they are both diameters. We want to find what both radius's values are added on. 
     However without it gives the balls a cool forcefeild type gap.
     */
    return dist(loc.x, loc.y, newLoc.x, newLoc.y) < ((d + newD)/2);
  }
}



