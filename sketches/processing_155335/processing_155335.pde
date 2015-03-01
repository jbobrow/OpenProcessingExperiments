
float r;
int R = 180;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(0);
}

void draw() {
  background(360);

  noFill();

  for (int i = 1; i <= 10; i++) {
    stroke(360*(i-1)/10, 100, 100);

    pushMatrix();
    translate(width/2, height/2);
    beginShape();
    for (float t = 0; t < TWO_PI; t += 0.1) {
      r = 1 / (i * sin(t/2)+1);
      vertex( R * r * cos(t), R * r * sin(t));//, 5, 5);
    }
    endShape(CLOSE);
    popMatrix();
  }
  stroke(0, 120);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}



