
//setup
void setup() {
  size(500, 500);
  background(0);
  noLoop();
}
//loop
void draw() {
  for (int i=0;i<500;i=i+20) {
    for (int j=0; j<500;j=j+20) {
      //colors, dimensions
      fill((random(255)));
      noStroke();
      rect(i, j, 20, 20);
    }
  }
}
//change apperance
void mousePressed() {
  redraw();
}



