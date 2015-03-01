
void setup() {
  size(640, 640);
  strokeWeight(50);
  strokeJoin(ROUND);
}

void draw() {
  float angle = sin(radians(frameCount));
  color c = color(map(abs(angle), 0, 1, 0, 125), abs(angle*200), abs(angle*200));
  background(c);
  fill(c);
  stroke(255);
  for (int i = -720; i <= 720; i+=180) {
    for (int q = -720; q <= 720; q+=180) {
      pushMatrix();
      translate(width/2+i/1.5, height/2+q/1.1);
      rotate(radians(i+q+90+angle*90));
      scale(abs(angle));
      beginShape();
      vertex(0, -40);
      vertex(-50, 50);
      vertex(50, 50);
      endShape(CLOSE);
      popMatrix();
    }
  }
}



