
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Walker w;

void setup() {
  size(400,400);
  frameRate(30);

  // Create a walker object
  w = new Walker();

}

void draw() {
  background(255);
  // Run the walker object
  w.walk();
  w.render();
}



class Walker {
  float x, y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void render() {
    stroke(0);
    fill(175);
    rectMode(CENTER);
    rect(x, y, 40, 40);
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {
    float vx = random(-2, 2);
    float vy = random(-2, 2);
    x += vx;
    y += vy;

    // Stay on the screen
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }
}
