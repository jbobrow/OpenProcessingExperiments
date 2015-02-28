
class Particle {

  // Variables for location of particles
  float x, y;

  // constructor
  Particle(float x, float y) {
    this.x = x;
    this.y = y;
  }

  // Functions of particles
  void run() {
    walk();       // Move particles
    draw();       // Display particles
  }

  // move particles
  void walk() {
    this.x += random(-0.947, 1);
    this.y += random(-0.87, 1);

    // change location if particles reach edge
    if (this.x < 0) {
      this.x = width;
    }
    if (this.y < 0) {
      this.y = height;
    }
    if (this.x > width) {
      this.x = 0;
    }
    if (this.y > height) {
      this.y = 0;
    }
  }

  // display particles
  void draw() {
    noStroke();
    fill(255);
    ellipse(x, y, 1, 1);
  }
}


