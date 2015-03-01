
ArrayList<Object> objects;
ArrayList<Object> chain;
int num = 20;
int counter = 0;


void setup() {
  size(600, 600);
  background(0);
  smooth();
  objects = new ArrayList<Object>();
  chain = new ArrayList<Object>();

  for (int i = 0; i < num; i++) {
    for (int j = 0; j < num; j++)
      objects.add(new Object(2*num+width/num*i, 2*num + height/num*j));
  }
}

void draw() {
  background(0);

  for (Object o : objects) {
    o.update();
    o.checkMouse();
    o.borders();
  }

  counter ++;
  if (chain.size() > 1 && (counter > 5)) {
    Object c = chain.get(0);
    chain.remove(0);
    c.reset();
    counter = 0;
  }
  
  if (mousePressed) {
    for (Object o : objects) {
      o.display();
    }
     noFill();
  } else {
    fill(50, 100, 255, 70);
  }
    beginShape(TRIANGLE_STRIP);
    stroke(50, 100, 255, 150);
    for (int i = 0; i < chain.size ()-1; i++) {
      if (chain.size() > 0) {
        Object c = chain.get(i);
        vertex(c.position.x, c.position.y);
      }
    }
    endShape(); 
}

void mousePressed() {
  for (Object o : objects) {
    if (o.d <= o.r) {
      o.display();
    }
  }
}

class Object {

  PVector position;
  PVector velocity;
  float r;
  boolean addNew = true;
  float d;

  Object(float x, float y) {

    position = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    r = random(50);
  }

  void update() {
    velocity.limit(0.5);
    position.add(velocity);
  }

  void reset() {
    addNew = true;
  }

  void borders() {
    if ((position.x - r < 0) || (position.x + r > width)) {
      velocity.x *= -1;
    }
    if ((position.y - r < 0) || (position.y + r > width)) {
      velocity.y *= -1;
    }
  }

  void checkMouse() {
    PVector mouse = new PVector(mouseX, mouseY);
    d = mouse.dist(position);
    if (d <= r && addNew == true) {
      chain.add(this);
      addNew = false;
    }
  }

  void display() {
    noStroke();
    fill(20, 250, 250, 30);
    ellipse(position.x, position.y, r*2, r*2);
  }
}

