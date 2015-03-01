
void setup() {
  size(900, 400);
  smooth();
  background(25);
  strokeWeight(3);
  stroke(#059cdd);
  text("Move your cursor to the right >>", 20, 350);
}

float a = 0;
float x = 0;

void draw() {
  //Multiplying lots of sin(); and mapping to the wanted height
  float y = map(sin(a)*sin(a*0.7)*sin(a*0.9), -1, 1, 20, 300);
  
  //Creating the point
  line(x, y, x, 0);

  //Gets mouse X position on canvas, maps to 0 - 0.09 interval
  float mousePos = map(mouseX, 0, width, 0, 0.09);
  
  //Adds mousePos to sin parameter
  a = a + mousePos + 0.05;
  
  //Adds mousePos to x increase
  x = x + 6;

  //Resets the canvas when the points reach the end of the screen 
  if (x > width) {
    background(25);
    text("Move your cursor to the right >>", 20, 350);
    x = 0;
  }
}

