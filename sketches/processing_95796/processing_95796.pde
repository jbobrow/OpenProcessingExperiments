
/*
Arraylist example
 Jennifer Presto
 Example for BFA class in Creative Computing
 April 9, 2013
 
 Code below adapted from Daniel Shiffman's
 example 23-2: Simple Particle System with ArrayList,
 available here:
 www.learningprocessing.com/examples/chapter-23/example-23-2/
 
 */
ArrayList particles;

void setup() {
  size(200, 400);
  particles = new ArrayList();
  smooth();
}

void draw() {

  background(255);

  // must cycle through ArrayList backwards, because
  // removing objects in the middle
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = (Particle) particles.get(i);
    p.run();
    p.gravity();
    p.display();

    // check to see if particle has fallen off screen
    // if so, remove it from the ArrayList

    if (p.y>height) {
      particles.remove(i);
    }
  }

  println(particles.size());
}

// add a new particle each time the mouse is pressed
void mousePressed() {
  particles.add(new Particle());
}


class Particle {
  float x;
  float y;
  float xspeed;
  float yspeed;

  Particle() {
    x = mouseX;
    y = mouseY;
    xspeed = random(-1, 1);
    yspeed = random(-3, 0);
  }

  void run() {
    x = x + xspeed;
    y = y + yspeed;
  }

  void  gravity() {
    yspeed += 0.05;
  }

  void display() {
    stroke(0);
    fill(0, 75);
    ellipse(x, y, 10, 10);
  }
}



