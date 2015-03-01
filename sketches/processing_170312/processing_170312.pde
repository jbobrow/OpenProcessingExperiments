
Sphere[] spheres = new Sphere[4];
boolean globalGrow = true;

void draw() {
  background(0);
 

  for (int x=0; x<3; x++) {
    for (int y=0; y<3; y++) {
      if (spheres[x].intersect(spheres[y])) {
        if (x != y) {
          color c = color(random(255), random(255), random(255));
          spheres[x].resetMe(c);
          spheres[y].resetMe(c);
        }
      }
    }
  }
 
  for (int i=0; i<3; i++) {
    if (globalGrow == true) {
      spheres[i].sizeIt();
    }
    spheres[i].display();
  }
}

void setup() {
  size(600, 600);

  for (int i = 0; i < spheres.length; i ++ ) {
    spheres[i] = new Sphere ();
  }
}

 
void mousePressed() {
  if (globalGrow == true) {
    globalGrow = false;
  } else {
    globalGrow = true;
  }
}

class Sphere {
  float r;
  float x, y;
  color c;
 
  Sphere() {
    resetMe(color(random(255,0)));
  }
  void resetMe(color tempC) {
    r = 0;
    x = random(width);
    y = random(height);
    c = tempC;
  }
 void sizeIt() {
    r+=.5;
  }
  void display() {
    fill(c);
    ellipse(x, y, r*2, r*2);
  }
 
  boolean intersect(Sphere b) {
    float distance = dist(x, y, b.x, b.y);
    if (distance < r + b.r) {
      return true;
    } else {
      return false;
    }
  }
}


