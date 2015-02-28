
void setup () {
  size (250, 250);
}

void draw () {
  strokeWeight(mouseX/30);
  stroke(random(255),random(255),random(255));
for (int y = 0; y < height; y=y+10) {
  for (int x=0; x < width; x = x+10) {
    fill(random(255),random(255),random(255));
    rect(x, y, 10, 10);
   
  }
}
}
