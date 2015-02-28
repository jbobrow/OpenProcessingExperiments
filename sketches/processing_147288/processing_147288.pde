
// allow user to place a circle of radius R at a location on the canvas
// with a mouse click
 
float R;
ArrayList<Circle> circles;
 
 
void setup() {
  size(900, 500);
  R = 15;
  circles = new ArrayList<Circle>();
}
 
void draw() {
  background(0);
  fill(255, 255, 0);
  stroke(0);
  for (int i=0; i<circles.size(); i++) {
    circles.get(i).render();
    circles.get(i).move();
  }
 
  for (int i=0; i<circles.size(); i++ ) {
    if (circles.get(i).isStale()) {
      circles.remove(i);
      i--;
    }
  }
}
 
void mouseClicked() {
  if (mouseButton==LEFT) {
    circles.add(new Circle(mouseX, mouseY, R));
  }
  if (mouseButton==RIGHT) {
    for (int i=0;i<circles.size();i++) {
      circles.get(i).toggleGravity();
    }
  }
}
 
// define the Circle class
class Circle {
  // class data/variables
  float centerX, centerY;
  float vx, vy, ax, ay;
  float radius, elasticity;
  float v_max, v_min;
  //float fallspeed;
  boolean gravity;
 
  // Constructor, builds the object when it is declared.
  Circle(float x, float y, float r) {
    v_max = 10;
    v_min = -10;
    centerX = x;
    centerY = y;
    //random velocity
    vx = random(0, 0.5);
    vy = random(0, 0.5); //random(v_min, v_max)
    ax = 0;
    ay = 0.0000000000002; //random(-0, -0.700)
    radius = r/5;
    // 1 is a perfectly elastic collision, no energy lost
    // 0.9 means about 10% of the velocity in the direction of the collision is lost
    elasticity = 1;
    //fallspeed = 900;
    gravity = true;
  }
 
  void render() {
    stroke(0);
    if (gravity) {
      fill(0, 100, 240);
    }
    else {
      fill(100, 150, 50);
    
    }
    ellipse(centerX, centerY, random(0,2)*radius, random(0,2)*radius);
    ellipse(centerX, centerY, random(0,5)*radius, random(0,5)*radius);
  
   
  }
 
  // update the position according to Newtonian motion
  void move() {
    if (gravity) {
      vx += ax
      vy += ay;
    }
    centerX += vx;  // syntactically equivalent to x = x+vx
    centerY += vy;
    // top wall collision
    if (centerY<radius) {
      centerY = 2*radius - centerY;
      vy = -vy*elasticity;
    }
 
    // bottom wall collision
    if (centerY>height-radius) {
      centerY = 2*(height-radius) -centerY;
      vy = -vy*elasticity; //-vy*elasticity
      
    }
 
    // left wall collision
    if (centerX<radius) {
      centerX = 2*radius - centerX;
      vx = -vx*elasticity; //-vx*elasticity
    }
 
    // right wall collision
    if (centerX>width-radius) {
      centerX = 2*(width-radius)-centerX;
      vx = -vx*elasticity;
    }
  }
 
  // return true if the circle is off the bottom of the
  // screen, false otherwise
  boolean isStale() {
    return (centerY > height + radius);
  }
 
  // toggle the gravity, turn gravity on and off
  void toggleGravity() {
    gravity = !gravity;
  }
}
