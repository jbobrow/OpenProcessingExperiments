
class Spring2D {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
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
  rect(x/2, y, radius*5, radius/2);
  //strokeWeight(1);
  //stroke(40, 50);
  //line(x, y, nx, ny);
  
}
}

int numSprings = 255;
Spring2D[] s = new Spring2D[numSprings];
float gravity = 2.0;
float mass = 3.0;

void setup() {
size(100, 500);
smooth();
fill(0);
for (int i = 0; i < numSprings; i++) {
s[i] = new Spring2D(width/2, i*(height/numSprings), mass, gravity);
}
}
void draw() {
background(255);
s[0].update(mouseX, mouseY);
s[0].display(mouseX, mouseY);
for (int i = 1; i < numSprings; i++) {

s[i].update(s[i-1].x, s[i-1].y);
s[i].display(s[i-1].x, s[i-1].y);
}
}


