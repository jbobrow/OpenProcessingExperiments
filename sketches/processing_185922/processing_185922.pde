
/**
A dandelion-- A major tweak on the PolarToCartesian conversion
example by Daniel Shiffman
 */

float r;
float i;
// Angle and angular velocity, accleration
float theta;
float theta_vel;
float theta_acc;

void setup() {
  size(640, 360);

  // Initialize all values
  r = height * 0.45;
  theta = 0;
  theta_vel = 0;
  theta_acc = 0.001;
}

void draw() {
  background(0);

  // Translate the origin point to the center of the screen
  translate(width/2, height/2);
  // Convert polar to cartesian
  float x = r * cos(theta/2);
  float y = r * sin(theta/2);
  float x1 = r * cos(theta/3);
  float y1 = r * sin(theta/3);
  float x2 = r * cos(theta/4);
  float y2 = r * sin(theta/4);
  stroke(255);
  strokeWeight(2);
  line(0, 0, x, y);
  line(0, 0, x1, y1);
  line(0, 0, x2, y2);
  line(0, 0, x*-1, y*-1);
  line(0, 0, x1*-1, y1*-1);
  line(0, 0, x2*-1, y2*-1);
  // Draw the ellipse at the cartesian coordinate
  ellipseMode(CENTER);
  noStroke();
  fill(255, 255, 255, 200);
  ellipse(x*-1, y*-1, 32, 32);
  ellipse(x, y, 32, 32);
  ellipse(x1, y1, 32, 32);
  ellipse(x1*-1, y1*-1, 32, 32);
  ellipse(x2, y2, 32, 32);
  ellipse(x2*-1, y2*-1, 32, 32);

  // Apply acceleration and velocity to angle (r remains static in this example)
  theta_vel += theta_acc;
  theta += theta_vel;
  float ran = random(25,32);
   if(theta_vel>= 1.3) {
      ellipse(random(x-10), random(y-10), ran, ran);
      ellipse(random(x-10), random(y-10), ran, ran);
   }
}

