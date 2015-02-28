
/**
 * Chain. 
 * 
 * One mass is attached to the mouse position and the other 
 * is attached the position of the other mass. The gravity
 * in the environment pulls down on both. 
 */

float gravity = 6.0;
float mass = 2.0;
int numsprings = 2;

ArrayList springs;

void setup() 
{
  size(500, 500);
  smooth();
  fill(0);
  noStroke();
  
  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
  }}); 
  
  springs = new ArrayList();
  for (int i=0; i<numsprings; i++) {
    springs.add(new Spring2D(0, i*12, mass, gravity));
  }
}

void draw() 
{
  background(204);
  Spring2D firstspring = (Spring2D) springs.get(0);
  firstspring.update(mouseX, mouseY);
  firstspring.display(mouseX, mouseY);

  for (int i=1; i<springs.size(); i++) {
    Spring2D spring = (Spring2D) springs.get(i);
    Spring2D backspring = (Spring2D) springs.get(i-1);
    spring.update(backspring.x, backspring.y);
    spring.display(backspring.x, backspring.y);
  }
}

void mouseWheel(int delta) {
  if(delta == 1) {
    Spring2D spring = (Spring2D) springs.get(springs.size()-1);
    springs.add(new Spring2D(spring.x, spring.y+12, mass, gravity));
  }
  if(delta == -1 && springs.size() > 1) {
    springs.remove(springs.size()-1);
  }
}

void keyPressed() {
  if(keyCode == 40) {
    Spring2D spring = (Spring2D) springs.get(springs.size()-1);
    springs.add(new Spring2D(spring.x, spring.y+12, mass, gravity));
  }
  if(keyCode == 38 && springs.size() > 1) {
    springs.remove(springs.size()-1);
  }
}

class Spring2D {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity;
  float mass;
  float radius = 10;
  float stiffness = 0.3;
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
    ellipse(x, y, radius*2, radius*2);
  }
}

