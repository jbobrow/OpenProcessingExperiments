
float angle = 0.0; // Current angle
float speed = 0.02; // Speed of motion
float radius = 100.0; // Range of motion
float sx = 2.2;
float sy = 2.15;

void setup() {
  size(500, 500);
  //noStroke();
  smooth();
}

void draw() {
  fill(0, 4);
  //rect(0, 0, width, height);
  angle += speed; // Update the angle
  float sinval = sin(angle);
  float cosval = cos(angle);
  
  fill(255);
  // Set the position of the small circle based on new
  // values from sine and cosine
  //float x = width/2 + (cosval * radius*2);
  //float y = height/2 + (sinval * radius*2);
//  
  //ellipse(x, y, 2, 2); // Draw smaller circle


  // Set the position of the large circles based on the
  // new position of the small circle
  float x2 = width/2 + cos(angle * sx ) * radius;
  float y2 = height/2 + sin(angle * sy ) * radius;
  ellipse(x2, y2, radius/2, radius/2); // Draw larger circle
}
