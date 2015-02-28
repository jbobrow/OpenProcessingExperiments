
/**
 * Mouse 2D. 
 * 
 * Moving the mouse changes the position and size of each box. 
 */
 // Angle and angular velocity, accleration
float theta;
float theta_vel;
float theta_acc;

void setup() 
{
  size(640, 360); 
  noStroke();
  rectMode(CENTER);
  dim = width/2;
  background(0);
 // colorMode(HSB, 360, 100, 50);
  ellipseMode(RADIUS);
  r = height * 0.45;
  theta = 0;
  theta_vel = 0;
  theta_acc = 0.0001;
}

void draw() 
{   
  background(0);
  for (int x = 0; x <= width; x+=dim) {
    drawGradient(x, height/2);
  }
  
  fill(360, 360);
  rect(mouseX, height/2, mouseY/2+10, mouseY/2+10);
  fill(360, 360);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);

  // Translate the origin point to the center of the screen
  translate(width/2, height/2);
  
  // Convert polar to cartesian
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  // Draw the ellipse at the cartesian coordinate
  ellipseMode(CENTER);
  noStroke();
  ellipse(x, y, 32, 32);
  
  // Apply acceleration and velocity to angle (r remains static in this example)
  theta_vel += theta_acc;
  theta += theta_vel;
}

void drawGradient(float x, float y) {
  int radius = 400;
  float h = random(0, 360);
  for (int r = radius; r > 0; --r) {
    fill(h, 90, 90);
    ellipse(x, y, r, r);
    h = (h + 1) % 360;
  }
}



