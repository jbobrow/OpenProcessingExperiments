
float max_distance;

void setup() {
  size(400, 400); 

  smooth();
  noStroke();
  max_distance = dist(0, 0, width, height);
}

void draw() 
{
  background(#44D3CB);
  int d = mouseX/10;
  int e = 50;
  for(int i = 0; i <= width; i += 15) {
    for(int j = 0; j <= height; j += 15) {
      float size = dist(mouseX, mouseY, i, j);
      size = size/max_distance * 20;
      ellipse(i, j, size, size);
    }
  }
}


