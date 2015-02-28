
int howMany = 100;
int col = 255;
int incr = 5;
Element[] Elem = new Element[howMany];

void setup() {
  PVector location;
  PVector speed;
  size(600, 300);
  background(0);

  for (int i = 0; i < howMany; i ++) {
    location = new PVector(random(width), random(height));
    //speed = new PVector(random(5), random(2));
    speed = new PVector(random(-incr,incr),random(-incr,incr));
    Elem[i] = new Element(location, speed);
  }
}

void draw() {
  for (int i = 0; i < howMany; i ++) {
    Elem[i].display();
  }
  if (frameCount % 700 ==0) {
    col = abs(col-255);
  }
}

void mouseClicked() {
  save(random(12345)+".png");
}

class Element {

  PVector location, speed;
  float prevX, prevY;

  Element(PVector _location, PVector _speed) {
    location = _location;
    speed = _speed;
  }

  void display() {
    stroke(col);
    strokeWeight(1);
    prevX = location.x;
    prevY = location.y;
    location.add(speed);
    
    line(prevX, prevY, location.x, location.y);

    if (location.x > width || location.x < 0) {
      speed.x *= -1;
    }
    if (location.y > height || location. y < 0) {
      speed.y *= -1;
    }
  }
}



