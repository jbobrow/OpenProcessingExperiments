
void setup() {
  size(300, 200);
  background(0);
  smooth();
}

void draw() {
  noStroke();
  fill(0, 80);
  rect(0, 0, width, height);

  noFill();
  
  stroke(255, 0, 0, 80);
  for (int i = 0; i < 5; i++) {
    strokeWeight(20 - i * 3);
    bezier(100, 150, random(70, 130), random(70, 130), random(70, 130), random(70, 130), random(70, 130), random(50, 90));
  }

  stroke(255, 255, 0, 15);
  for (int j = 0; j < 5; j++) {
    strokeWeight(5);
    bezier(100+random(-5, 5), 155, random(70, 100), random(70, 130), random(70, 150), random(70, 130), random(70, 130), random(50, 90));
  }

  stroke(100, 100, 255, 80);
  for (int p = 0; p < 5; p++) {
    strokeWeight(20 - p * 3);
    bezier(200, 150, random(170, 230), random(70, 130), random(170, 230), random(70, 130), random(170, 230), random(50, 90));
  }

  stroke(255, 15);
  for (int q = 0; q < 5; q++) {
    strokeWeight(5);
    bezier(200+random(-5, 5), 155, random(170, 200), random(70, 130), random(170, 250), random(70, 130), random(170, 230), random(50, 90));
  }
}

