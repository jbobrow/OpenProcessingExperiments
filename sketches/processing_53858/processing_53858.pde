
//This project has taken code from the Distance 2D example, found in the 
//Math folder. By Hiro Nagaoka

float max_distance;

void setup() {
  size (1000, 400);
  smooth();
  max_distance = dist(0, 0, width, height);
}

void draw() 
{
  background(0);


  noStroke();
  fill(255);
  rect(150, 100, 200, 200);

  fill(255);
  rect(400, 100, 200, 200);

  fill(255);
  rect(650, 100, 200, 200);


  for (int i = 0; i <= width; i += 20) {
    for (int j = 0; j <= height; j += 20) {
      float size = dist(mouseX, mouseY, i, j);
      size = size/max_distance * 200;
      ellipse(i, j, size, size);
    }
  }
}





