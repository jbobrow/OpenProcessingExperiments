
void setup() {
  size (400, 400);
  background(255, 0, 50);
  noLoop();
}

void draw() {
  //face(100, 320);
  //face(310, 120);
  //face(140, 180);
  //face(70, 230);
  //face(280, 320);
  //face(219, 80);
for (int i= 0; i <8; i++) {
  face (random(50, 350), random(50, 350));
 } 
}

void face (int x, int y) {
  noStroke();
  fill(0, 159, 250);
  ellipse (x, y, 95, 95);
  
  fill (0);
  ellipse (x-20, y-20, 12, 12);
  ellipse (x+20, y-20, 12, 12);
  
  fill (255);
  ellipse (x-22, y-20, 4, 4);
  ellipse (x+18, y-20, 4, 4);
  ellipse (x, y, 15, 15);
  
  stroke(0);
  strokeWeight(5);
  line (x-20, y+20, x+20, y+20);
}
