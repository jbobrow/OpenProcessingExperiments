

// DEFINIZIONE DELLA CLASSE

class Circle 
{
  PVector pos;
  PVector vel = new PVector();

  Circle (PVector startPos) {
    pos = startPos;
  }

  void update() {
    pos.add(vel);
    vel.add(gravity);

    if (pos.y > height-4) {
      vel.y = vel.y * -0.95; 
      pos.add(vel);
    }
  }
  
  void display() {
    ellipse(pos.x,pos.y,8,8);
  }
}

// USO DELLA CLASSE

PVector gravity;
Circle[] cerchi = new Circle[1000];

void setup() {
  size (400,400);
  noStroke();
  gravity = new PVector(0, 0.2);
  for (int i=0; i<cerchi.length; i++) {
    float x = random(width);
    float y = random(height-10);
    cerchi[i] = new Circle( new PVector(x,y) );
  }  
}

void draw() {
  background(0);
  for (int i=0; i<cerchi.length; i++) {
    cerchi[i].update();
    cerchi[i].display();
  }  
}

