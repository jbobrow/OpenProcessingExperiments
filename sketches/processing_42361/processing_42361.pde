
void setup() {
  size(400, 400);
  smooth();
}
void draw() {
  background(255);
  stroke(10,255,5);
        for (int y=0; y<height; y=y+30) {
      for (int x=0; x<width; x=x+10) {
        line(x, y, 200, 200);
      }
    }
  stroke(0);
  for (int y=0; y<height; y=y+30) {
      for (int x=0; x<width; x=x+10) {
        ellipse(x, y+mouseY, 30, 30);
      }
    }

}
                
