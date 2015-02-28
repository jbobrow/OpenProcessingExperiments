
void setup() {
  size(300, 300);
  colorMode(RGB);
  background(0);
  smooth();
}

void draw() {

  //lines coming from the bottom right corner down
  for (int x=25;x<=width;x+=25) {
    stroke(255);
    strokeWeight(2);
    line(x, 0, width, height);
  }
  //lines coming from the top right corner down
  for (int x=25;x<=width;x+=25) {
    stroke(255);
    strokeWeight(2);
    line(width, 0, x, height);
  }
  //red points setting up center axis of the composition
  for (int x=0;x<=width;x+=25) {
    stroke(255,0,0);
    strokeWeight(4);
    point(x, height/2);
  }
}


