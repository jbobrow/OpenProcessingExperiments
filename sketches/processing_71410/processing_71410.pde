
void setup() {

  size(1000, 800);
  smooth();

  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100);
  noStroke();
}

void draw() {
  
  fill(0, 0, 100);
  rect(0, 0, width, height);
  
  for (int i = 0; i <= width; i+=40) {
    for (int j = 0; j <= height; j+=40) { 

      float d = dist(mouseX, mouseY, i, j);
      float c = map(d, 0, 1131, 100, 275);
      float r = map(d, 0, 1131, 45, 5);

      translate(i, j);
      float atan = atan2(mouseX, mouseY);


      rotate(atan);
      fill(c, 85, 75, 70);
      rect(0, 0, r, r);
      
      rotate(-1*atan);
      translate(-1*i, -1*j);
      
    }
  }
}
