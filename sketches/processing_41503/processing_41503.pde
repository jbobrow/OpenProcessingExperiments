
void setup() {
  size(700,600);
  background(255);
  smooth();
  noStroke();
}

void draw() {
  
for (int i=25; i < width; i=i+50) {
  for (int j=25; j < height; j=j+50) {
  ellipse(i, j, 25, 25);
  fill(random(0,255),random(0,255),random(0,255));
  }
}
}

void mouseClicked() {
  stop();
}
                    
