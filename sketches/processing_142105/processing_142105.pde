
import toxi.geom.*;

//DECLARE
ArrayList amoebaCollection;

int depth = 150; //NUMBER_OF_PARTICLES
float s = 1; //SIZE_OF_PARTICLE

void setup() {
  size(750, 750);
  smooth();

  //INITIALIZE
  amoebaCollection = new ArrayList();

  for (int i = 0; i < depth; i++) {

    PVector origin = new PVector(random(0.45*width, 0.55*height), random(0.45*width, 0.55*height), 0);
    Amoeba myAmoeba = new Amoeba(origin);
    amoebaCollection.add(myAmoeba);
  }
}

void draw() {

  noStroke();
  fill(0, 0, 0, 255/frameCount);
  rect(-1, -1, width+1, height+1);
  fill(0, 0, 0, 40);
  rect(-1, -1, width+1, height+1);

  //translate(0.5*width,0.5*height);

  //CALL_FUNCTIONALITY
  for (int i = 0; i < amoebaCollection.size(); i++) {
    Amoeba mb = (Amoeba) amoebaCollection.get(i);
    mb.run();
  }
}


class Amoeba {
  //GLOBAL_VARIABLES

  float distance = 0;
  float dif = 0;

  PVector loc = new PVector ();
  PVector acc = new PVector();
  PVector speed = new PVector (random(-1, 1), random(-1, 1), 0); //SPEED_OF_BALLS
  PVector cent = new PVector(0.5*height, 0.5*width, 0);

  //CONSTRUCTOR 
  Amoeba(PVector _loc) {
    loc = _loc;
  }

  //FUNCTIONS
  void run() {
    display();
    move();
    followPoint();
  }

  void followPoint() {

    PVector target = new PVector(mouseX, mouseY);

    PVector mouse = new PVector (0.5*width, 0.5*height);

    float mouseDist = target.dist(cent);

    if (mouseDist > 200) {

      mouse.sub(loc);

      PVector dif = mouse;

      float distance = dif.mag();

      dif.normalize();

      dif.limit(20/distance);

      acc.add(dif);
    }
    else {

      target.sub(loc);

      PVector dif = target;

      float distance = dif.mag();

      dif.normalize();

      dif.limit(20/distance);

      acc.add(dif);
    }
  }

  void move() {

    speed.add(acc);

    speed.limit(5);

    loc.add(speed);

    acc.limit(3.99);
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(255);
    noStroke();
    ellipse(0, 0, s*3.8, s*3.8);
    popMatrix();
  }
}



