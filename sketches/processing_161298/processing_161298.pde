
Cloud c1;
Cloud c2;
Cloud c3;
ArrayList<Particle> glitch;

void setup() {
  size(500, 500);
  c1 = new Cloud(50, new PVector(random(width/2, width), random(0, height)));
  c2 = new Cloud(50, new PVector(random(width/2, width), random(0, height)));
  c3 = new Cloud(50, new PVector(random(width/2, width), random(0, height)));
  glitch = new ArrayList<Particle>();
}

void draw() { 

  background(7,155,176);
  for (int i = glitch.size () - 1; i >= 0; i--) {
    Particle p = glitch.get(i);
    p.display();
  }
  
  c1.display();
  c1.move(1);
  c2.display();
  c2.move(1);
  c3.display();
  c3.move(1);
}

void keyPressed() {
 if(key == 32) {
  c1.resetCounter();
  c2.resetCounter();
  c3.resetCounter();
  glitch.clear();
 } 
}

/**
 * A class describing a physical particle in a 2D space. Particles have a position (x,y), a velocity, an acceleration and a mass.
 * They also have a lifespan after which they will be declared "dead" (the ParticleSystem that generated the particle can then
 * remove it from memory).
 */
class Particle {

  PVector location;
  color f;

  // Constructor. Particle can be created with a starting location, velocity and mass.
  Particle(PVector location_) {
    location = location_.get();
    f = getRandomColor();
  }

  void run() {
    display();
  }

  void display() {
    stroke(f);
    strokeWeight(2);
    fill(f);
    rectMode(CENTER);
    rect(location.x, location.y, 5, 5);
  }

  color getRandomColor() {
    color c = color(random(255), random(255), random(255));
    return c;
  }
}

class Cloud {
  int size;
  PVector loc;
  int speed;
  int id;
  int counter = 0;

  PImage small;
  PImage large;

  Cloud(int size_, PVector loc_) {
    size = size_;
    loc = loc_.get();

    id = int(random(0, 2));

    small = loadImage("sc.png");
    large = loadImage("bc.png");
  }

  void display() {
    fill(255);
    stroke(0);
    strokeWeight(3);
    imageMode(CENTER);

    if (id == 0)
      image(large, loc.x, loc.y, size*2, size);

    else
      image(small, loc.x, loc.y, size*1.5, size);
  }

  void move(int speed) {
    loc.x -= speed;
    if (loc.x + size < 0) {
      loc.x = width + size;
      loc.y = random(size, height - size);
      counter += 1;
      id = int(random(0, 3));
    }

    if (counter < 1) {
    }

    else if (counter >= 1 && counter < 2) {
      glitch.add(new Particle(new PVector(loc.x + size/2, loc.y + size/3)));
      small = loadImage("sc1.png");
      large = loadImage("bc1.png");
    } 

    else if (counter >= 2 && counter < 3) {
      glitch.add(new Particle(new PVector(loc.x + size/2, loc.y + size/3))); 
      glitch.add(new Particle(new PVector(loc.x + size/2, loc.y +size/3 - 8)));
      small = loadImage("sc2.png");
      large = loadImage("bc2.png");
    } 

    else {
      glitch.add(new Particle(new PVector(loc.x + size/2, loc.y + 8))); 
      glitch.add(new Particle(new PVector(loc.x + size/2, loc.y - 8))); 
      glitch.add(new Particle(new PVector(loc.x + size/2, loc.y)));
      small = loadImage("sc3.png");
      large = loadImage("bc3.png");
    }
  }
  
  void resetCounter() {
   counter = 0; 
   small = loadImage("sc.png");
   large = loadImage("bc.png");
  }
}



