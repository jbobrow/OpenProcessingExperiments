
float max_distance;

void setup() {
  size(600,600); 
  smooth();
  noStroke();
  max_distance = dist(0, 0, width, height);
}

void draw() {
  background(random (255), random(255),0);

  for(int x = 0; x <= width; x += 20) {
    for(int y = 0; y <= height; y += 20) {
      float size = dist(mouseX, mouseY, x, y);
      size = size/10;
      fill(random(x+20), random(y+200), 200, random(200));
      ellipse(x, y, size, size);
    }
  }
}

