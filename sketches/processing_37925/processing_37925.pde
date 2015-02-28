
void setup (){
  size(500, 500);
  background(0);
  smooth();
}

void draw (){
  float xPos;
  float yPos;
  float innerC;
  for (int x = 0; x<= width; x+=50) {
      for (int y= 0; y<=height; y+=50) {
        for (int ellipseSize = 50; ellipseSize >= 0; ellipseSize -=7) {
          xPos = x + random(mouseX/50);
          yPos = y + random(mouseX/50);
          innerC = map(mouseX, 0, 500, 255, 0);
          fill(random(innerC, 255), random(innerC, 255), random(innerC, 255), 50);
          ellipse(xPos, yPos, 50, ellipseSize);
        }
      }
  }
}


