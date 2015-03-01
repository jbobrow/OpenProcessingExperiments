
void setup() {
  size(600, 600);
  background(#000000);
}

void draw() {
  noStroke();
  background(#000000);
  fill(255, 255, 255, 100);
  ellipse(600-map(second(), 0, 59, 100, 500), 100, 50, 50);

  for(int i = 0; i < 60; i++) {
    ellipse(i*(450/60)+100,100, 5, 5);
  }

  ellipse(map(minute(), 0, 59, 100, 500), 300, 50, 50);
  
    for(int i = 0; i < 60; i++) {
    ellipse(i*(450/60)+100,300, 5, 5);
  }
  
  ellipse(map(hour(), 0, 24, 100, 500), 500, 50, 50);
  
  for(int i = 0; i < 24; i++) {
    ellipse(i*(450/24)+100,500, 5, 5);
  }
  
}

