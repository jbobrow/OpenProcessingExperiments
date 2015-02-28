
// PolarToCartesian
// Daniel Shiffman <http://www.shiffman.net>

// Convert a polar coordinate (r,theta) to cartesian (x,y)
// x = r * cos(theta)
// y = r * sin(theta)

float r;
float r1;
// Angle and angular velocity, accleration
float theta;
float theta_vel;
float theta_acc;

void setup() {
  size(800,900);
  smooth();
  
  // Initialize all values
  r = 30.0;
  theta = 0.0;
  theta_vel = 0.0;
  theta_acc = 0.0003;
  
  r1 = 200.0;
  theta = 0.0;
  theta_vel = 0.0;
  theta_acc = 0.0001;
  
}

void draw() {
  background(0);
  // Translate the origin point to the center of the screen
  translate(width/2,height/2);
  
  // Convert polar to cartesian
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  float x1 = r1 * cos(theta);
  float y1 = r1 * sin(theta);
  
  
  // Draw the rectangle at the cartesian coordinate
  
  
  //primera
  
  
  ellipseMode(CENTER);
  strokeWeight(10+theta);
  stroke(255);
  fill(255-theta);
  line(0,-450,x1,y1);
  line(x1,y1,0,450);
  ellipse(x1,y1,mouseX,mouseY);
   theta_vel += theta_acc;
  theta += theta_vel;
  
  
  //segunda
  strokeWeight(10);
  stroke(255);
  fill(255-theta);
  line(200,-300,x+200,y-170);
  line(x+200,y-170,200,300);
  ellipse(x+200,y-170,16+x,16+x);
  
  
  //tercera
  strokeWeight(10);
  stroke(255);
  fill(255-theta);

  line(-170,-300,x-170,y+50);
  line(x-170,y+50,-170,300);
  ellipse(x-170,y+50,16+x,16+x);
  
  
  //cuarta
  strokeWeight(10);
  stroke(255);
  fill(255-theta);
  line(-100,-300,x-100,y-200);
  line(x-100,y-200,-100,300);
  ellipse(x-100,y-200,16+x,16+x);
  
  
  //quinta
  strokeWeight(10);
  stroke(255);
  fill(255-theta);
  line(150,-300,x+150,y+170);
  line(x+150,y+170,150,300);
  ellipse(x+150,y+170,16+x,16+x);
  
  
  
//  theta_vel += theta_acc;
//  theta += theta_vel;
  //theta = -theta;
//  
  // Apply acceleration and velocity to angle (r remains static in this example)
  

}





