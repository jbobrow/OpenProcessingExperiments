
//DECLARE
ArrayList amoebaCollection;

int depth = 150; //NUMBER_OF_PARTICLES
float particleS = 3; //SIZE_OF_PARTICLE


float circClr = 0;
float transparency = 0;
float hiveS = 0;

void setup() {
  size(750, 750);
  smooth();

  //INITIALIZE
  amoebaCollection = new ArrayList();

  for (int i = 0; i < depth; i++) {

    PVector origin = new PVector(random(0.5*width, 0.5*height), random(0.5*width, 0.5*height), 0);
    Amoeba myAmoeba = new Amoeba(origin);
    amoebaCollection.add(myAmoeba);
  }
}

void draw() {

  noStroke();
  fill(127.5, 127.5, 127.5, 255);
  rect(0, 0, 750, 750);

  //CALL_FUNCTIONALITY
  for (int i = 0; i < amoebaCollection.size(); i++) {
    Amoeba mb = (Amoeba) amoebaCollection.get(i);
    mb.run();
  }
  fill(circClr, circClr, circClr, transparency);
  ellipse(0.5*height, 0.5*width, hiveS, hiveS);
}


class Amoeba {
  //GLOBAL_VARIABLES

  float distance = 0;
  float dif = 0;
  PVector loc = new PVector ();
  PVector acc = new PVector();
  PVector vel = new PVector();
  PVector speed = new PVector (random(-1, 1), random(-1, 1), 0); //SPEED_OF_PARTICLES
  PVector cent = new PVector(0.5*height, 0.5*width, 0);
  float rndmS = random(1, 3); //SCALE_FACTOR_OF_RANDOM_PARTICLE_SIZE
  float particleClr = random(0, 1); //RANDOM_PARTICLE_COLOR

  //CONSTRUCTOR 
  Amoeba(PVector _loc) {
    loc = _loc;
  }

  //FUNCTIONS
  void run() {
    display();
    move();
    followPoint();
    cohesion(0.001);
    circleExpansion();
  }

  void circleExpansion() {
    PVector target = new PVector(mouseX, mouseY);
    PVector cent = new PVector(0.5*height, 0.5*width, 0);
    float mouseDist = target.dist(cent);

    if (mouseDist > 30) {
      circClr = 255;
      transparency = 255;
    } 
    else {
      circClr = 0; 
      transparency = 150;
    }

    for (int i = 0; i < amoebaCollection.size();i++) {
      Amoeba other = (Amoeba) amoebaCollection.get(i);

      float distance = cent.dist(other.loc);

      float average = 5*distance/i;

      hiveS = 100/map(average, 0.2, 20, 1, 15);
    }
  }

  void cohesion(float magnitude) {

    PVector sum = new PVector();
    int count = 0;

    for (int i = 0; i < amoebaCollection.size();i++) {
      Amoeba other = (Amoeba) amoebaCollection.get(i);

      float distance = loc.dist(other.loc);

      if (distance > 0 && distance < 100) {

        sum.add(other.loc);
        count++;
      }
    }

    if (count > 0) {

      sum.mult(1.0/count);
    }

    PVector steer = sum;

    steer.sub(loc);

    steer.mult(magnitude);

    acc.add(steer);
  }

  void followPoint() {

    PVector target = new PVector(mouseX, mouseY);

    PVector mouse = new PVector (0.5*width, 0.5*height);

    float mouseDist = target.dist(cent);

    if (mouseDist > 30) {

      mouse.sub(loc);

      PVector dif = mouse;

      float distance = dif.mag();

      dif.normalize();

      dif.limit(20/distance);

      acc.add(dif);
    }
  }

  void update() {

    vel.add(acc);

    vel.limit(1);

    loc.add(vel);
  }

  void move() {

    speed.add(acc);

    speed.limit(3);

    loc.add(speed);

    acc.limit(1);
  }

  void display() {

    if (particleClr <= 0.5) {
      fill(255, 255, 255, 255);
      stroke(255, 255, 255, 127.5);
    }
    if (particleClr > 0.5) {
      fill(63.75, 63.75, 63.75, 191.25);
      noStroke();
    }

    pushMatrix();
    translate(loc.x, loc.y);
    ellipse(0, 0, particleS*rndmS, particleS*rndmS);
    popMatrix();
  }
}



