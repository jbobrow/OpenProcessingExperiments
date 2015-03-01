
void setup() {
  size(800, 400);
}


void draw() {
  background (mouseY, 200, mouseX);
  noStroke();
  noCursor();
  for (int x=0; x<800; x=x+10) {
    for (int y=0; y<400; y=y+10) {
      fill(x*0.5,y*0.5,250);
      float perro = dist(mouseX, mouseY, x, y);
      if (perro<20) {
        ellipse(x, y, 10, 10);
      }
    }
  }

}
