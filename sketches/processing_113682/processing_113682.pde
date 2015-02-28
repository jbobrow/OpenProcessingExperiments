
void setup() {
  size(500, 500);
  colorMode(HSB);
}

void draw() {
  background(0);
  for ( int i = 1; i <=height; i=i+20) { 
    for (int j = 1; j<= width;
j=j+50) {
        stroke(random(255),255,255,50);
        noFill();
        float distance = dist(mouseX,mouseY,i,j);
      ellipse(i, j, distance, distance);
    }
  }
}
