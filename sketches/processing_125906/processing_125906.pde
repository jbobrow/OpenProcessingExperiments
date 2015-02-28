
Mover [] movers = new Mover [3];

void setup() {
  size(400, 400);
  smooth();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].bounce();
    movers[i].display();
  }
}
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector target;
  PVector dir;
  float topspeed = 10;
  float xoff;
  float yoff;
  float [] xpos = new float [50];
  float [] ypos = new float [50];
  float xtime;
  float ytime;


  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    xoff = random(100);
    yoff = random(100);
    xtime = random(0, 10);
    ytime = random(0, 100);
  }

  void update() {
    xoff+=0.01;
    yoff+=0.01;
    xtime+=0.01;
    ytime+=0.01;
    target = new PVector(noise(xoff)*width, noise(yoff)*height);
    dir = PVector.sub(target, location);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    for (int i = 0; i < xpos.length-1; i++) {
      xpos[i] = xpos[i+1]; 
      ypos[i] = ypos[i+1];
    }
    xpos[xpos.length-1] = location.x;
    ypos[ypos.length-1] = location.y;
    for (int i = 0; i < xpos.length; i++) {
      smooth();
      fill((250 + i)/(1 + i/5));
      noStroke();
      ellipse(xpos[i], ypos[i], i*3/4, i*3/4);
    }
  }



  void bounce() {
    if (location.x > width || location.x < 0) {
      velocity.x *= -1;
      acceleration.x *= -1;
    } 
    if (location.y > height || location.y < 0) {
      velocity.y *= -1;
      acceleration.y *=-1;
    }
  }
}



