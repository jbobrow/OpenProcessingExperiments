
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Song Youngjun
// ID: 201420083

void setup() {
  size (600, 600);
  smooth();
  noLoop();
}

void draw() {
  background(255);
  float r1 = random(0.1, 2);
  stroke(0, 70);
  strokeWeight(r1);
  for (float a = 0; a <= width; a = a+40) {
    for (float b = 0; b <= height; b = b+40) {
      line(width/4, height/4, a, b);
      line((width/4)*3, (height/4)*3, a, b);
      line(width/4, (height/4)*3, a, b);
      line((width/4)*3, height/4, a, b);
      line(width/2, height/2, a, b);
    }
  }


  for (float c = 0; c <= width; c = c+60) {
    for (float d = 0; d <= height; d = d+60) {
      strokeWeight(random(10));
      point(c, d);
    }
  }
}

void keyPressed() {
  background(255);
  redraw();
} 

