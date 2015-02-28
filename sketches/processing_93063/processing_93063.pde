
void setup() {
  size(1920, 1080);
  background(255);
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
  image(loadImage("/Volumes/Student Work/Paige/1processing/avril/data/avril.png"), mouseX, mouseY);
 }

