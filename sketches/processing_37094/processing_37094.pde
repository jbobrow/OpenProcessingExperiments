
void setup() {
  size(300, 300);
  colorMode(RGB, width);
}

void draw() {
  for (int x = 0; x<width; x++) { //background gradient
    stroke(x, x, width);
    line(0, x, width, x);
  }
  for (int y=0; y<width; y+=10) {
    strokeWeight(3);
    stroke(0);
    line(y, height/3, y, height);
  }
  for (int z=10; z<width +50; z+=30) {
    noStroke(); //noStroke is here because I also like when fill is set to width, I chose to leave it at 0
    fill(0);
    ellipse(z, height/3, 20, z);
  }
}


