
void setup() {
  size(500, 500);
  colorMode(HSB);
  background(255);
  smooth();
  noLoop();
}


void draw() {
  drawSuika(410, 0, 0); //red
  drawSuika(30, 5, 410); //white  
  drawKawa1(30, 12); //green1
  drawKawa1(10, 10); //white  
  drawKawa2(230, 240, 470); //green2
  drawKawa2(220, 230, 480); //green3
  drawKawa2(210, 220, 490); //green4  
  drawTane(); //tane
}


void drawSuika(float a1, float a2, float a3) {
  for(int x = 0; x < height/2; x++) {
    for(int i = 0; i < a1; i++) {
      strokeWeight(random(1, 3));
      stroke(random(10), random(245, 255) - i * a2, random(245, 255));
      line(a3 + i, x * 2, a3 + i, x * 2 - random(2, 5));
    }
  }
}


void drawKawa1(float b1, float b2) {
  for(int x = 0; x < height/2; x++) {
    for(int i = 0; i < b1; i++) {
      strokeWeight(random(1, 3));
      stroke(random(90, 110), i * b2, random(240, 250));
      line(440 + i, x * 2, 440 + i, x * 2 - random(2, 5));
    }
  }
}


void drawKawa2(float c1, float c2, float c3) {
  for(int x = 0; x < height/2; x++) {
    for(int i = 0; i < 10; i++) {
      strokeWeight(random(1, 3));
      stroke(random(90, 110), 255, random(c1, c2));
      line(c3 + i, x * 2, c3 + i, x * 2 - random(2, 5));
    }
  }
}


void drawTane() {
  noStroke();
  float range = random(6, 8);
  for(int y = 0; y < 6; y++) {
    for(int x = 0; x < 3; x++) {
      fill(0, random(100, 230));
      ellipse(100 + x * 120 + random(-range, range),
              70 + y * 70 + random(-range, range), 
              25, 15);
    }
  }
}

