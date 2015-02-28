
void setup() {
  size(800, 200);
  noLoop();
  noStroke();
}
 
void draw() {
  background(100,163,173);
 
  for (int i=25; i<width; i+=50) {
    perfume(i, 70, int(random(50, 250)), random(-5, 5));
  }
}
 
void perfume(float x, float y, float a, float b) {
  pushMatrix();
  translate(x, y);
  rotate(b);
  fill(random(250), random(50), random(250));
  quad(80, 118, 110, 120, 95, 125, 65, 123);
  quad(110, 120, 110, 145, 95, 155, 95, 125);
  quad(65, 123, 95, 125, 95, 155, 65, 150);
  quad(65, 155, 130, 162, 115, 175, 43, 165);
  quad(43, 165, 115, 175, 115, 275, 43, 258);
  quad(115, 175, 130, 162, 115, 275, 130, 255);
  ellipse(88, 165, 32, 7);
  line(72, 153, 72, 165);
  line(105, 150, 105, 165);
  popMatrix();
}

void mousePressed () {
  redraw ();
   
}




