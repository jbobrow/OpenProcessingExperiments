
void setup() {
  size(800, 800);
  colorMode(RGB,800,800,800);
  frameRate(20);
  smooth();
  background(800,700,750);
  noStroke();

}
 
void draw() {
  int x1 = (int)random(800);
  int y1 = (int)random(800);
  int x2 = (int)random(800);
  int y2 = (int)random(800);
  quad(x1, y1, x2, y2, y2, mouseY, x1, x2);
  fill(x1,mouseY,x2,80);


}
 
void mousePressed() {
    background(800,700,750);
}
  void keyPressed() {
  saveFrame("test.png");
}

