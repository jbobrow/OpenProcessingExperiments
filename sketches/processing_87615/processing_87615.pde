
void setup() {
  size(200, 200);
}

void draw() {
  for (int x = 0; x < width; x += int(random(0,200))) {
    for (int y = 0; y < height; y += int(random(30,40))) {
      for (int colors = 0; colors < 255; colors += int(random(10))) {
        if (random(0,x) > random (0,y)){
          fill(0,0,0, colors);
          println(width);
        }
        else {
          fill(252,252,252);
        }
        rect(int(random(mouseX,x)), int(random(mouseY,y)), int(random(5,10)), int(random(5, 10)));
      }
    }
  }
}


