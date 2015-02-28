
float radius =40;
float circle_X = 104;
float circle_Y = 60;
void setup() {
  size(400, 400);
}

void draw() {
  background(0, 50, 20);
  //is the mouse inside the circle?
  if ( dist(mouseX, mouseY, circle_X, circle_Y) < radius) { 
    fill(255, 0, 126);
    rect(300, 300, 100, 100);
  } else {
    fill(255);
    arc(200, 100, 40, 40, 0, PI+2);
  }
  ellipse(circle_X, circle_Y, radius*2, radius*2); 
  //drawing the circle is optional 
}
