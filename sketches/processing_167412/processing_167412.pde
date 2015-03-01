
Spring2D s1, s2;

float gravity = 10.0;
float mass = 2.0;

void setup() 
{
  size(1440, 900);
  fill(255, 255);
  // Inputs: x, y, mass, gravity
  s1 = new Spring2D(0.5, width/4, mass, gravity/4);
  s2 = new Spring2D(0.5, width/4, mass/2, gravity/4);
}

void draw() 
{
  background(0);
  s1.update(mouseX, mouseY);
  s1.display(mouseX, mouseY);
  s2.update(s1.x, s1.y);
  s2.display(s1.x, s1.y);
}

class Spring2D {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity;
  float mass;
  float radius = 30;
  float stiffness = 0.2;
  float damping = 0.7;
  
  Spring2D(float xpos, float ypos, float m, float g) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
  }
  
  void update(float targetX, float targetY) {
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
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

