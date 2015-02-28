
/** Bodies moving according to Kepler's Rule
  */

float theta1, theta2;        // declare polar angle
float R1, R2;                // declare polar radius
float T1, T2;                // declare period
float v1, v2;
void setup() {
  size(500, 500); 
  
  theta1 = 0;            // initialize central angles
  theta2 = 0;
  
  R1 = height * 0.35;    // initialize central radii
  R2 = height * 0.15;
  
  T1 = pow(R1, 1.5);     // compute periods by Kepler's Rule
  T2 = pow(R2, 1.5);
  
  v1 = 2*PI/T1;          // angular velocity
  v2 = 2*PI/T2;  
  
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  
  noFill();
  
  //draw background ellipse representing orbits
  
  stroke(62, 56, 56);
  ellipse(0, 0, 2*R1, 2*R1);
  ellipse(0, 0, 2*R2, 2*R2);
  
  float x1 = R1 * cos(theta1);   // compute cartesian x
  float y1 =  R1 * sin(theta1);  // compute cartesian y
  
  float x2 = R2 * cos(theta2);   // compute cartesian x
  float y2 =  R2 * sin(theta2);  // compute cartesian y
  
  // draw the ellipse at the cartesian coordinates
  
  ellipseMode(CENTER);
  noStroke();
  fill(200);
  
  ellipse(x1, y1, 15, 15);
  ellipse(x2, y2, 15, 15);
  
  // update angle
  
  theta1 += v1;
  theta2 += v2;

}



