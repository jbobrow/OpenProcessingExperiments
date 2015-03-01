
// The Nature of Code by Daniel Shiffman: random numbers/noise/cellular automata 
// A dragonfly with movement/animation that is randomly driven.
// wings are cellular automaton images (rules 45 and 124)

/*@pjs preload="window.png,cloud.png,wing1.png,wing2.png";*/

Vehicle dragonFly;
Window   window;

void setup() {
  size(495, 595); 
  window = new Window();
  dragonFly = new Vehicle(width/2, height/2);
}

void draw() {
  window.display();
  dragonFly.fly();
}

class Vehicle {
  VehicleDraw vDraw;
  PVector  pos, noff;

  Vehicle(int x, int y) {
    vDraw = new  VehicleDraw();
    pos = new PVector(x, y); 
    noff = new PVector(random(1000), random(1000));
  }

  void move() {
    pos.x = map(noise(noff.x), 0, 1, 0, width);
    pos.y = map(noise(noff.y), 0, 1, 0, height);
    noff.add(0.01, 0.01, 0);
  }

  void display() {
    translate(pos.x, pos.y);
    vDraw.display();
  }

  void fly() {
    move();
    display();
  }
}

class VehicleDraw {
  PImage w1, w2;
  float angle, x, y;

  VehicleDraw() {
    w1 = loadImage("wing1.png"); 
    w2 = loadImage("wing2.png");
    angle  = 0;
    x = 0;
    y = 0;
  }

  void drawBody() {
    noStroke();
    fill(40);
    ellipse(x, y, 50, 100);
    ellipse(x, y-61, 50, 20);
    ellipse(x+12, y-70, 10, 10);
    ellipse(x-12, y-70, 10, 10);
    noFill();
    stroke(0);
    strokeWeight(1);
    arc(x+50, y-72, 100, 100, PI, PI+HALF_PI);
    arc(x-50, y-72, 100, 100, PI+HALF_PI, TWO_PI);
  }

  void display() {
    scale(.5);
    drawBody();
    animateWingsAndTail();
  }

  void animateWingsAndTail() {
    noFill();
    stroke(0);
    strokeWeight(1);

    //  wings
    pushMatrix();
    angle = random(-20, 10);
    rotate(radians(angle));
    image(w1, x+7, y-46);
    ellipse(x+120, y-20, 230, 55);
    popMatrix();

    pushMatrix();
    angle = random(-10, 20);
    rotate(radians(angle));
    image(w1, x-233, y -46);
    ellipse(x-120, y-20, 230, 55);
    popMatrix();

    pushMatrix();
    angle = random(0, 30);
    rotate(radians(angle));
    image(w2, x+10, y-10);
    ellipse(x+95, y+8, 175, 42);
    popMatrix();

    pushMatrix();
    angle = random(0, 30);
    rotate(radians(-angle));
    image(w2, x-180, y-10);
    ellipse(x-96, y +8, 175, 42);
    popMatrix();

    // tail
    pushMatrix(); 
    beginShape(); 
    stroke(40);
    strokeWeight(10);
    vertex(x, y+55);
    vertex(random(-10, 10), 150);
    endShape();
    popMatrix();
  }
}

class Window {
  PImage  w, c;
  float x;

  Window() {
    w = loadImage("window.png");
    c = loadImage("cloud.png");
    x = -330;
  }
  void display() {
    background(#FEFF0D);
    image(c, x, 10);
    image(w, 0, 0);
    x = x + 0.5;
    if (x > width) x = -330;
  }
}



