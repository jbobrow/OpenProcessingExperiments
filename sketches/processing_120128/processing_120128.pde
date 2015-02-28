
Spring2D s1, s2, s3, s4, s5, s6, s7;

float gravity = 2.0;
float mass = 4.0;

void setup() 
{
  size(800, 800);
  //fill(255, 126);
  // Inputs: x, y, mass, gravity
  s1 = new Spring2D(height/2, width/2, mass, gravity);
  s2 = new Spring2D(height/2, width/2, mass, gravity);
  s3 = new Spring2D(height/2, width/2, mass, gravity);
  s4 = new Spring2D(height/2, width/2, mass, gravity);
  s5 = new Spring2D(height/2, width/2, mass, gravity);
  s6 = new Spring2D(height/2, width/2, mass, gravity);
  s7 = new Spring2D(height/2, width/2, mass, gravity);
  
}

void draw() 
{
  background(51);
  //fill(random(128, 255), random( 0, 99), random(0, 71));
  fill(random(200, 255),0, 0);
  s1.update(mouseX, mouseY);
  s1.display(mouseX, mouseY);
  fill(255, random(140, 200), 0);
  s2.update(s1.x, s1.y);
  s2.display(s1.x, s1.y);
  fill(255, 255, random(0, 102));
  s3.update(s2.x, s2.y);
  s3.display(s2.x, s2.y);
  fill(random(0, 153), random(204, 255), 0);
  s4.update(s3.x, s3.y);
  s4.display(s3.x, s3.y);
  fill(random(0, 51), random(102, 204), random(102, 255));
  s5.update(s4.x, s4.y);
  s5.display(s4.x, s4.y);
  fill(random(128, 153), random(0, 50), random(128, 211));
  s6.update(s5.x, s5.y);
  s6.display(s5.x, s5.y);
  fill(random(199, 238), random(21, 130), random(133, 238));
  s7.update(s6.x, s6.y);
  s7.display(s6.x, s6.y);
}

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
    ellipse(x, y, radius*2, radius*2);
    stroke(255);
    //line(x, y, nx, ny);
  }
}


