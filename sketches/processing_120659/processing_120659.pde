
// Angle and angular velocity, accleration
float theta;
float theta_vel;
float theta_acc;
float r;

void setup() {
  size(800, 800);
  
  // Initialize all values
  r = height * 0.1;
  theta = 0;
  theta_vel = 0;
  theta_acc = 0.0001;
}

void draw() {
  background(255);
  smooth();
  ellipseMode(CENTER); //draw yellow ellipse (Sun) in center of canvas
  fill(255,255,0);  // Set fill to yellow
  ellipse(400, 400, 45, 45);
  
  // Translate the origin point to the center of the screen
  translate(width/2, height/2); // what can I do to get it so that it start to draw aboue the Sun?
  
  // Convert polar to cartesian
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  // Draw the ellipse at the cartesian coordinate
  ellipseMode(CENTER);
  stroke(1);
  fill(200);
  ellipse(x, y, 10, 10);
  
  // Apply acceleration and velocity to angle (r remains static in this example)
  theta += 0.01;

}



