
/**
 Trig_triangle demonstrates the use of the sine and cosine functions. Use the left and
 right arrow keys to change the angle.
*/

float hypotenuse;
int theta_degrees;
float a_x;
float a_y;

void setup() {
  size(500, 500);
  stroke(0);
  strokeWeight(5);
  strokeJoin(ROUND);
  smooth();
  textFont(loadFont("CourierNewPS-BoldMT-24.vlw"));
  hypotenuse = 400;
  theta_degrees = 45;
  a_x = 50;
  a_y = 450;
}

void draw() {
  // Calculate the triangle sides.
  float theta_radians = radians(theta_degrees);
  float opposite = hypotenuse * sin(theta_radians);
  float adjacent = hypotenuse * cos(theta_radians);
  
  // Calculate the vertex coordinates.
  float b_x = a_x + adjacent;
  float b_y = a_y - opposite;
  float c_x = b_x;
  float c_y = a_y;
  
  // Draw the triangle.
  background(150);
  fill(115, 155, 232);
  triangle(a_x, a_y, b_x, b_y, c_x, c_y);
  
  // Draw the text.
  fill(0);
  textAlign(RIGHT);
  text("θ=" + theta_degrees, 490, 25);
  text("hyp=" + round(hypotenuse), 490, 50);
  text("opp=" + round(opposite), 490, 75);
  text("adj=" + round(adjacent), 490, 100);
}
  
// Use left and right arrow keys to decrease and increase the angle.
void keyPressed() {
  if (keyCode == 37) { // left arrow
    theta_degrees--;
  } else if (keyCode == 39) { // right arrow
    theta_degrees++;
  }
  theta_degrees = constrain(theta_degrees, 1, 89);
}

