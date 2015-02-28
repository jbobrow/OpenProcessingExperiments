
class Circle {
  PVector loc; // Location of ball
  PVector vel; // Velocity of ball
  float radius;
  
  Circle(int x, int y, float radius) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    this.radius = radius;
  }
  
  void update() {
    loc.add(vel);
  }
  
  void draw() {
    noStroke();
    ellipseMode(CENTER);

    float size = 2 * radius;
    ellipse(ball.loc.x, ball.loc.y, size, size);
    
    strokeWeight(1);
    stroke(0, 0, 255);
    PVector tassel = PVector.add(loc, PVector.mult(vel, -10.5));
    line(ball.loc.x, ball.loc.y, tassel.x, tassel.y);
  }
}


