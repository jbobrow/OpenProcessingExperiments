
int numSprings = 3;
Spring2D[] s = new Spring2D[numSprings];
float gravity = 5.0;
float mass = 3.0;

void setup() {
  size(500, 500);
  
  for (int i = 0; i < numSprings; i++) {
    s[i] = new Spring2D(width/2, i*(height/numSprings), mass, gravity);
  }
}

void draw() {
  background(20,160,180);
  fill(255,180,0,200);
  s[0].update(mouseX*4, mouseY*4);
  s[0].display(mouseX*1.5, mouseY*1.5);
  for (int i = 1; i < numSprings; i++) {
    s[i].update(s[i-1].x, s[i-1].y);
    s[i].display(s[i-1].x, s[i-1].y);
  }
  fill(10,200,50,100);
    ellipse(80,70, 125,125);
  fill(20,160,180);
  beginShape();
    vertex(80,70);
    vertex(150,60);
    vertex(150,15);
  endShape(CLOSE);
  
  pushMatrix();
  translate(350,300);
  rotate(HALF_PI);
  scale(1.5);
  fill(10,200,50,150);
    ellipse(80,70, 125,125);
  fill(20,160,180);
  beginShape();
    vertex(80,70);
    vertex(150,60);
    vertex(150,15);
  endShape(CLOSE);
  popMatrix();
  
  pushMatrix();
  translate(450,150);
  rotate(PI/1.3);
  scale(0.7);
  fill(10,200,50,100);
    ellipse(80,70, 125,125);
  fill(20,160,180);
  beginShape();
    vertex(80,70);
    vertex(150,60);
    vertex(150,15);
  endShape(CLOSE);
  popMatrix();
}
class Spring2D {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity;
  float mass;
  float radius = 10;
  float stiffness = 0.2;
  float damping = 0.7;
  int shrink = 0;

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
    shrink -= 13;
  }

  void display(float nx, float ny) {
    noStroke();
    ellipse(x/4, y/4, 60, 60);
  }
}


