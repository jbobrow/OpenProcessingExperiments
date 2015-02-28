
ArrayList<Mover> m;

void setup() {
  size(300, 600);
  m= new ArrayList<Mover>();
  m.add(new Mover());
}
void draw() {
  background(180, 201, 255);

  for (int i= m.size()-1; i>=0; i--) {
    Mover m1 = m.get(i);
    m1.update();
    m1.display();
    m1.applyForce();
  }

  stroke(255);
  strokeWeight(10);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  fill(145);
  text("click to see more baloons", 20, 20);
}

void mousePressed() {
  m.add(new Mover());
}
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector force;

  float t;

  Mover() {
    location = new PVector(random(10, width), height, 0);
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector (0, -0.01, 0);  
    force = new PVector(0, 0, 0);
    t = random(3);
  }

  void update() {
    location.add(velocity);
    velocity.add(acceleration);
    // acceleration.mult(0);
    if (location.x<10) location.x=10;
    if (location.x>width-10) location.x=width-10;
    if (location.y<0) {
      velocity.y=-velocity.y/2;
    }
  }


  void display() {
    noFill();
    strokeWeight(1);
    ellipse(location.x, location.y, 30, 30);
    bezier(location.x, location.y+15, location.x+3+3*sin(t), location.y+30, location.x-3+cos(t)*7, location.y+30, location.x+sin(t)*5, location.y+60);

  }

  void applyForce() {
    force.x=map(noise(t), 0, 1, -1, 1.03);
    //force.x +=noise(t);
    location.add(force);
    t+=0.1;
  }
}

