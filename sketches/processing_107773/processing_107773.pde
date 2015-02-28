
float x,y, theta, r, c;

void setup() {
  size(600,600);
  x = width/2;
  y = height/2;
}

void draw() {

  float x = width/2 + r * cos(theta);
  float y = width/2 + r * sin(theta);

  // Draw an ellipse at x,y
  noStroke();
  c = int(0+(1.6*theta));
  fill(c);
  noStroke();
  // Adjust for center of window
  ellipse(x, y, 70, 70); 

  // Increment the angle
  theta += .4;
  // Increment the radius
  r += 1;

}
