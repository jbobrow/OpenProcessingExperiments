
float rot = 0;
float number = random(1,100) ;
// initial position for our circle
float circle_x = 300;
float circle_y = 20;
// how much to move the circle on each frame 
float move_x = 60;
float move_y = -20;

void setup() {
  size(400, 400);
  background(255);
  smooth();
}
void draw_rotating_rectangle(float x, float y, float rect_size, float r) {
  translate(x, y);
  rotate(r);
  rect(0, 0, rect_size, rect_size);
  resetMatrix();
  noStroke();
  strokeWeight(30);
}
void draw() {
  float x = 0;
  while (x < 8) {
    float y = 0;
    while (y < 8) { 
      // FunProgramming we give a unique rotation amount to each rectangle, depending
      // on which column and row the ellipse is located (x and y)
     fill(random(255), random(255), random(255));
      draw_rotating_rectangle(50+ x * 75, 60 + y * 61, 16, rot + x + y);
      y = y + 1;
    }
    x = x + 1;
  }
  rot = rot + 0.40;
    float ellipse_size = random(1,25);
fill(random (255), random (255), random (255), random (255)); ellipse(random(0,499),random(0,499), ellipse_size,ellipse_size);
fill(random (255), random (255), random (255 )); ellipse(random(0,499),random(0,499), ellipse_size, ellipse_size);
}
void keyPressed(){
  //FunProgramming: when spacebar is pressed, then it will reset the whole page and change the color of the background
  if (key== ' '){
    background(random(255),random(255),random(255));
  }
}
