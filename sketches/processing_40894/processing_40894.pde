
//Will Cordes
//Assignment 7.1, Lecture 7
//Current Plan for Studio


int eOne = 1000; // number of particles.
PImage plan;
obj[] myObj = new obj[eOne];


void setup() {

  plan = loadImage("computation-7b.jpg");
  size(533, 300);
  colorMode(HSB,100);
  background(0);
  frameRate(500);

  //seeding array...
  for (int eOne = 0; eOne < myObj.length; eOne++) {
    myObj[eOne] = new obj();
  }
}


void draw() {

  for (int eOne = 0; eOne < myObj.length; eOne++) {
    myObj[eOne].build(); //void obj() for building objects.
    myObj[eOne].run(); //void run() for movement.
  }
}

class obj {
//what to build...
  int eTwo = int(random(width/4));
  int eThree = int(random(height));

  obj() {
  }

  void build() {
  //how to build...
    eTwo = eTwo + int(random(-12, 12));
    eThree = eThree + int(random(-12, 12));
  }

  void run() {
  //specifics...
    noStroke();
    color fromImage = plan.get(eTwo, eThree);
    stroke(fromImage);
    point(eTwo, eThree);
  }
}

