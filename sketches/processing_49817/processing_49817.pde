
void setup () {
  size(864, 486);
  background(30);
  smooth();
}

void draw() {
  frameRate(24);
  noStroke();
  fill(40, 30);
  rect(0, 0, 864, 486);

  translate(width/2, height/2);
  float s = frameCount/2;

  for (int i= 10; i<100; i++) {
    stroke(0, 200, 40, i/2);
    strokeWeight(i/2);
    line(0, 0, 0, 40);
    translate(0, -20);


    for (int j = 1; j<10; j++) {
      stroke(22, 183, 104, i/2);
      strokeWeight(j*2);
      rotate(radians(s/2));
      line(0, 0, 0, 100);

      for (int k = 1; k<j; k*=10) {
        translate(0, 60+s);
        noStroke();
        fill(0, 20, 0, 100);
        rotate(radians(2));
        ellipse(0, 0, 40, 10);
      }
    }
  }
}


