
float max_distance;

void setup() {
  size(600,400); 
  smooth();
  max_distance = dist(10, 10, width, height);
}

void draw() 
{
  background(#86662e);

  for(int i = 5; i <= width; i += 10) {
    for(int j = 0; j <= height; j += 30) {
      float size = dist(mouseX, mouseY, i, j);
      size = size/max_distance * 36;
      ellipse(i, j, size, size);
    }
  }
}


