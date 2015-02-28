
Spring2D[] springArray = new Spring2D[10];
float gravity = 5.0;
float mass = 2.0;

void setup() {
  size(500, 500);
  smooth();
  fill(0);
  
  for (int i=0; i<10; i++) {
    springArray[i] = new Spring2D(0.0, width/2, mass, gravity);
  }
}

void draw() {
  background(204);
  springArray[0].update(mouseX, mouseY);
  springArray[0].update(mouseX, mouseY);
  for (int i=1; i<10; i++) {
    springArray[i].update(springArray[i-1].x, springArray[i-1].y);
    springArray[i].display(springArray[i-1].x, springArray[i-1].y);
  }
}
class Spring2D {
  float vx, vy;
  float x, y;
  float gravity;
  float mass;
  float radius = 10;
  float stiffness = 0.2;
  float damping = 0.7;
  
  Spring2D(float xpos, float ypos, float m, float g) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
  }
  
  void update(float targetX, float targetY) {
    float forceX = stiffness * (targetX - x);
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = stiffness * (targetY - y);
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }
  
  void display(float nx, float ny) {
    noStroke();
    ellipse(x, y, radius*2, radius*2);
    stroke(255);
    line(x, y, nx, ny);
  }
}


