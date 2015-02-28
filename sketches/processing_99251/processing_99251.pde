
void setup() {
  size(600,600);
  smooth();
  background(25);
}

void draw() {
    frameRate(20);
  int r = int(random(0, 10));
  int a = int(random(50,95));
  int c = int(random(10,40));

  fill(random(255),random(25), random(60), a);
  
  arcs(mouseX, mouseY, r, c);
  arcs(mouseX/2, mouseY/2, r, c);
  arcs(mouseX/4, mouseY/4, r, c);
}
 
void arcs(int x, int y, int r, int c) {
  noStroke();
  bezier(x, y, r*c, c, r, r, c, c);

}





