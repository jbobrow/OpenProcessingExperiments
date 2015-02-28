
float r;

float theta;
float theta_vel;
float theta_acc;

void setup() {
  size(640, 360);
  
  r = height * 0.45;
  theta = 0;
  theta_vel = 0;
  theta_acc = 0.0005;
}

void draw() {
  
  background(255, 255, 255);
  translate(width/2, height/2);
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  ellipseMode(CENTER);
  noStroke();
  fill(255, 0, 0);
  ellipse(x, y, 32, 32);
  
  theta_vel += theta_acc;
  theta += theta_vel;
  
}
  


