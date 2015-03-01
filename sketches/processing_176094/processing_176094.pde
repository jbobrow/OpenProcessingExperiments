
ArrayList<Circle> circles = new ArrayList<Circle>();

float num = 250;

int min = 2;
int max = 100;

/* Our object */
Circle c = new Circle(new PVector(0, 0), (int)random(min, max));

void setup() {
  size(640, 640);
  noStroke();
  circles.add(c);
}

void draw() {
  background(255);
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

  c = new Circle(newLoc, newD);
  if(circles.size() < 10000){
    circles.add(c);
  }
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
    float c = abs(cos(radians(r+frameCount)));
    float s = abs(sin(radians(r+frameCount)));
    fill((c-s)*255, c*255, s*255);
    if (r < num) {
      ellipse(loc.x, loc.y, d, d);
    }
  }

  boolean detectCollision(PVector newLoc, int newD) {
    /* 
     We must divide d + newD because they are both diameters. We want to find what both radius's values are added on. 
     However without it gives the balls a cool forcefeild type gap.
     */
    return dist(loc.x, loc.y, newLoc.x, newLoc.y) < ((d + newD)/2);
  }
}



