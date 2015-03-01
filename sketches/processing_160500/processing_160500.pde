
final int LANEWIDTH = 4;
final int ROADWIDTH = LANEWIDTH * 2 + 3;

color ASPHALT = color(16);
color ROADYELLOW = color(255, 251, 0);
color ROADWHITE = color(223);
color ZOMBIE = color(0, 255, 0);
 
ArrayList<Intersection> intersections = new ArrayList();
ArrayList<Road> roads = new ArrayList();
ArrayList<Person> people = new ArrayList();
 
void setup() {
  size(800, 800);
  int gap = ROADWIDTH * 10;
  int margin = 50;
  for (int x = 0; x < 7; x++) {
    for (int y = 0; y < 7; y++) {
      int inter_x = margin + gap * x;
      int inter_y = margin + gap * y;
      intersections.add(new Intersection(inter_x, inter_y));
      if (y < 6) {
        roads.add(new Road(inter_x, inter_y + ROADWIDTH, 0, gap - ROADWIDTH));
      }
      if (x < 6) {
        roads.add(new Road(inter_x + ROADWIDTH, inter_y, gap - ROADWIDTH, 0));
      }
    }
  }
  
  for (int i = 0; i < 500; i++) {
    people.add(new Person(int(random(400)) + 200, int(random(400)) + 200));
  }
  people.get(0).isZombie = true;
}

void draw() {
  noStroke();
  background(0, 160, 0);
  for (Road r : roads) {
    r.draw();
  }
  for (Intersection i : intersections) {
    i.draw();
  }
  for (Person p : people) {
    p.update();
    p.draw();
  }
}

class Intersection {
  int x, y;
  Intersection(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void draw() {
    fill(ASPHALT);
    rect(x, y, ROADWIDTH, ROADWIDTH); 
  }
}

class Road {
  int x, y, xlen, ylen;
  
  Road(int x, int y, int xlen, int ylen) {
    this.x = x;
    this.y = y;
    this.xlen = xlen;
    this.ylen = ylen;
  }
  
  void draw() {
    fill(ASPHALT);
    if (xlen != 0) {
      rect(x, y, xlen, ROADWIDTH);
      fill(ROADWHITE);
      for (int side = 0; side <= 1; side++) {
        int xoff = side == 0 ? 0 : xlen - 3;
        for (int yoff = 1; yoff <= 9; yoff += 2) {
          rect(x + xoff, y + yoff, 3, 1);
        }
      }
      fill(ROADYELLOW);
      rect(x, y + LANEWIDTH + 1, xlen, 1);
    } else {
      rect(x, y, ROADWIDTH, ylen);
      fill(ROADWHITE);
      for (int side = 0; side <= 1; side++) {
        int yoff = side == 0 ? 0 : ylen - 3;
        for (int xoff = 1; xoff <= 9; xoff += 2) {
          rect(x + xoff, y + yoff, 1, 3);
        }
      }
      fill(ROADYELLOW);
      rect(x + LANEWIDTH + 1, y, 1, ylen);
    }
  }
}

int clamp(int n, int low, int high) {
  if (n < low) return low;
  if (n > high) return high;
  return n;
}

class Person {
  int x, y;
  color hairColor;
  boolean isZombie;
  
  Person(int x, int y) {
    this.x = x;
    this.y = y;
    hairColor = color(random(255), random(255), random(255));
    isZombie = false;
  }
  
  void update() {
    Person p = findNearest();
    if (p != null) {
      int dx = this.x - p.x;
      int dy = this.y - p.y;
      int manhattandist = abs(dx) + abs(dy);
      int speed = 1;
      if (isZombie) {
        // run towards victim!
        dx = -dx;
        dy = -dy;
        speed = int(random(5));
        // eat if close
        if (manhattandist < 3)
          p.isZombie = true;
      }
      if (random(manhattandist) <= abs(dx)) {
        x += dx > 0 ? speed : -speed;
      } else {
        y += dy > 0 ? speed : -speed;
      }
    } else {
      // otherwise, run around
      x += int(random(3)) - 1;
      y += int(random(3)) - 1;
    }
    x = clamp(x, 5, width - 5);
    y = clamp(y, 5, height - 5);
  }
  
  Person findNearest() {
    int minDist = 1000000;
    Person minPerson = null;
    for (Person p: people) {
      if (p.isZombie != isZombie) {
        int distSq = distSquared(p);
        if (distSq < minDist) {
          minDist = distSq;
          minPerson = p; 
        }
      }
    }
    return minPerson;
  }
  
  int distSquared(Person other) {
    int dx = this.x - other.x;
    int dy = this.y - other.y;
    return dx * dx + dy * dy;        
  }
  
  void draw() {
    if (isZombie) {
      fill(ZOMBIE);
      rect(x, y, 6, 6);
    } else {
      fill(hairColor);
      rect(x, y, 3, 3);
    }
  }
}
