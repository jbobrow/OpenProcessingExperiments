
//import processing.opengl.*;

Spring2D[] chain;

float gravity = 6.0;
float mass = 2.0;
float friction = 2;

float t = 0;

void setup() 
{
  size(500, 500);
  smooth();
  fill(0);
  // Inputs: x, y, mass, gravity
  chain = new Spring2D[15];
  for(int i = 0; i < chain.length; i++) {
    chain[i] = new Spring2D(random(width),random(height),2,2);
  }
  for(int i = 1; i < chain.length; i++) {
    chain[i].target = chain[i-1];
  }
}

void draw() 
{
  background(0);

  //chain[0].update(chain[chain.length-1].x,chain[chain.length-1].y);
  //chain[0].display(chain[chain.length-1].x,chain[chain.length-1].y);
  chain[0].update(mouseX,mouseY);
  chain[0].display(mouseX,mouseY);
  
  fill(0,0);
  beginShape(POLYGON);
  for(int i = 1; i < chain.length; i++) {
    chain[i].update();
    //chain[i].display();
    fill(0,0);
    curveVertex(chain[i].x,chain[i].y);
  }
  endShape();
}

class Spring2D {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity;
  float mass;
  float radius = 5;
  float stiffness = 0.2;
  float damping = .7;
  Spring2D target;
  
  Spring2D(float xpos, float ypos, float m, float g) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
  }
  Spring2D(float xpos, float ypos, float m, float g, Spring2D t) {
    target = t;
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
  
  void update() {
    float forceX = (target.x - x) * stiffness;
    float ax = forceX / mass;
    
    if( y > height-1 || y < 1) {
      if(vx > 0) vx-=friction;
      if(vx < 0) vx+=friction;
    }
    if( x > width-1 || x < 1) {
      if(vy > 0) vy-=friction;
      if(vy < 0) vy+=friction;
    }
    
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (target.y - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
    
    if(x > width || x < 0) {
      x += -vx;
    }
    if(y > height || y < 0) {
      y += -vy;
    }
  }
  
  void display(float nx, float ny) {
    //fill(100);
    noStroke();
    ellipse(x, y, radius*2, radius*2);
    stroke(255);
    line(x, y, nx, ny);
  }
  
  void display() {
    fill(100);
    noStroke();
    ellipse(x, y, radius*2, radius*2);
    stroke(255);
    line(x, y, target.x, target.y);
  }
}


