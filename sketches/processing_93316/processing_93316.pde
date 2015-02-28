
ArrayList<Particle> particles;
boolean isItFirst = true;
boolean isItBigger = false;
float big = 1;

void setup() {
  size(900, 800);
  particles = new ArrayList<Particle>();
  smooth();
  frameRate(200);
}

void draw() {
  frameRate(200);
  background(0);
  runFromAnywhere(width, height, 0);
  if(mousePressed) {
    if(mouseButton == LEFT) {
      runFromAnywhere(mouseX*2, mouseY*2, 200);
      frameRate(200);
    } else {
      frameRate(20);  
    }
  }
}

void runFromAnywhere(int x, int y, int colval){  
  particles.add(new Particle(new PVector(x/2, y/2)));
  for (int i=0; i<particles.size(); i++) {
    Particle p = particles.get(i);
    p.run(colval);
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0, 0);
    int extrafast = abs(mouseX-pmouseX);
    if(extrafast == 0){
      velocity = new PVector(random(-5, 5), random(-5, 5));
    } else if(extrafast < 20) {
      velocity = new PVector(random(-10, 10), random(-10, 10));
    } else if(extrafast < 40) {
      velocity = new PVector(random(-50, 50), random(-50, 50));
    } else {
      velocity = new PVector(random(-100, 100), random(-100, 100));
    }
    location = l.get();
    lifespan = height;
  }

  // Sometimes it’s convenient to have a “run”
  // function that calls all the other functions we need.
  void run(int colval) {
    update();
    display(colval);
    update();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    if(isItFirst) {
      lifespan -= 9.0;
      isItFirst = false;
    } else {
      lifespan -= 22.5;
    }
  }

  void display(int colval) {
    stroke(255, 200, colval);
    fill(255, 200);
    if(!isItBigger){
      ellipse(location.x, location.y, 2+big,2+big);
      isItBigger = true;
      big = big + 0.15;
    } else {
      ellipse(location.x, location.y, 2+big,2+big);
      isItBigger = false;
      big = big - 0.1;
    }
  }

  boolean isDead() {
    if (lifespan*5<120.0)
    {
      return true;
    }
    else 
    {
      return false;
    }
  }
}
