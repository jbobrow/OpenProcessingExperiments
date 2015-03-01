
void setup() {
  size(200,200);
  background(255);
  smooth();
  colorMode(RGB);
}
float r = 0;
float theta = 0;

void draw() {
float red = map(mouseX,0, width, 0, 255);
float green = map(mouseY, 0, height, 0, 255);
float blue = map(mouseX, 0, width/2, 0, 255);
float c = color(red, green, blue);
  // Polar to Cartesian conversion
  float x = r * cos(theta);
  float y = r * sin(theta);

  // Draw an ellipse at x,y
  noStroke();
  fill(c);
  // Adjust for center of window
  ellipse(x+width/2, y+height/2, 16, 16); 
  
  

  // Increment the angle
  theta += 0.01;
  // Increment the radius
  r += 0.05;
  
}
