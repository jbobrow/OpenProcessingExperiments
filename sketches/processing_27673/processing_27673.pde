
void setup() {
  size(640, 480);
  smooth();
}

void draw() {
  background(70); 
    
  float h = hour();
  float m = minute();
  float s = second();
  
  //second dial
  noStroke();
  fill(255);
  ellipse(50, 240, 1000, 1000);
    
  h = map(h, -5, 18, -43.02, 240);
  m = map(m, -1, 58, -100.53, 264);
  s = map(s, -1, 58, -100.53, 264);
  
  //minute dial
  fill(220);
  ellipse(50, 240, 720, 720);
  
  //hour dial
  fill(180);
  ellipse(50, 240, 440, 440);
  
  //meter
  strokeWeight(30);
  strokeCap(SQUARE);
  stroke(100, 100, 100, 80);
  line(0, 240, 550, 240);
  
  translate(50, 240);    
  
  int angle = 6;
  
    pushMatrix();
    rotate(s);
    for (int i = 1; i < 360; i += angle) {
    rotate(radians(angle));
    fill(0);
    textSize(15);
    text(i/6, 420, 5);
  } 
  popMatrix();
  
    pushMatrix();
    rotate(m);
    for (int i = 1; i < 360; i += angle) {
    rotate(radians(angle));
    fill(0);
    textSize(15);
    text(i/6, 280, 4);
  }
  popMatrix();
  
    pushMatrix();
    int angle2 = 15;
    rotate(h);
    for (int i = 0; i < 360; i += angle2) {
    rotate(radians(angle2));
    fill(0);
    textSize(20);
    text(i/15, 150, 20);
  }
  popMatrix();
}

