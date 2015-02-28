
float x = 0;
 
void setup() {
  size(400, 400);
  fill(#529ED6);
  noStroke();
}
 
void draw() {
  translate(200, 200);
  background(#C9FF29);
 
  fill(255, 0, 0);
  // this circle moves at 1 pixel per frame
  ellipse(x, 0, 10, 10);
  
  fill(0, 255, 0);
  // this circle moves at 2 pixels per frame
  ellipse(x * 2, 40, 10, 10);
  
  fill(0, 0, 255);
  // this circle moves half pixel per frame
  ellipse(x * 0.5, 80, 10, 10);
  
  x = x + 1;
}



float r = 0;

void setup() {
  size(400, 400);
  background(255);
  noStroke();
  fill(0);
  rectMode(CENTER);
}
void draw_rotating_rectangle(float x, float y, float rect_size, float rot) {
  translate(x, y);
  rotate(rot);
  rect(0, 0, rect_size, rect_size);
  resetMatrix();
}
void draw() {
  background(255);

  // these 5 rectangle rotate at different speeds
  // because we scale up or down the rotation speed
  // multiplying by numbers greater or smaller than 1
  draw_rotating_rectangle(100, 100, 80, r);
  draw_rotating_rectangle(300, 100, 40, r * 0.3);
  draw_rotating_rectangle(100, 300, 100, r * 0.6);
  draw_rotating_rectangle(300, 300, 20, r * 1.2);
  draw_rotating_rectangle(200, 200, 150, r * 2.3);

  r = r + 0.02;
}







