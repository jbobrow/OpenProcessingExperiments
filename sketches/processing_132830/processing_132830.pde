
Mover[] movers = new Mover[5];
PFont font;
PImage doge;
color[] ArrayOfColors = { 
  color(181, 230, 29), color(63, 72, 204), color(255, 174, 201), color(0, 162, 232), color(255, 127, 39), color(255, 242, 0), color(136, 0, 21), color(212, 176, 190), color(207, 209, 100), color(200, 120, 87)
};
String[] words = { 
  "wow", "much processing", "very Java", "much codee", "very scare", "PVectro", "much force", "frictoin", 
  "wow", "very Newton", "much law",
};
int index = int(random(words.length)); 
color rgb;
int bounce;



void setup() {
  size(1000, 750);
  millis();
  doge = loadImage("dogenowords2.jpg");
  font = loadFont("ComicSansMS-Bold-40.vlw");
  randomSeed(1);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.5, 8), random(width), 0);
  }
  bounce = 0;
  //fill(ArrayOfColors[(int) random(ArrayOfColors.length)]);
  rgb = (ArrayOfColors[(int) random(ArrayOfColors.length)]);
  fill(rgb);
  //Pick one word and one color per word at random from my arrays and then use those words in the draw loop as movers
}

void draw() {
  background(255);
  image(doge, 0, 0);
  for (int i = 0; i < movers.length; i++) {

    PVector wind = new PVector(1, 0);
    PVector gravity = new PVector(0, (1.0*movers[i].mass + (bounce/5)));

    float c = 0.1;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1.5); 
    friction.normalize();
    friction.mult(c);

    movers[i].applyForce(friction);
    if (bounce > 50) {
      movers[i].applyForce(wind);
    };
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    textFont(font, (mass*16));
    text((words[index]), location.x, location.y);
    //ellipse(location.x, location.y, mass*16, mass*16);
  }

  void checkEdges() {

    if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    //    if (location.x > width) {
    //      location.x = width;
    //      velocity.x *= -1;
    //    } 
    if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
    if (location.y == height) {
      ++bounce;
    }
  }
}



