
float angle = 0.0;
float offset = 150;
float scalar = 40;
float speed = 0.05;
PFont fontA;

void setup() {
  size(600, 400);
  smooth();
  ellipseMode(RADIUS);
  colorMode(HSB, 100);
  fontA = loadFont("Klavika-Light-48.vlw");
  textFont(fontA, 48);
}

void draw() {
  background(0);
  strokeWeight(3);
  stroke(31, 0, 100);
  float y1 = offset + sin(angle) * scalar;
  float y2 = offset + sin(angle + 0.4) * scalar;
  float y3 = offset + sin(angle + 0.8) * scalar;
  float y4 = offset + sin(angle + 1.2) * scalar;
  float y5 = offset+100 + sin(angle  + 1.2) * scalar;
  float y6 = offset+100 + sin(angle + 0.8) * scalar;
  float y7 = offset+100 + sin(angle + 0.4) * scalar;
  float y8 = offset+100 + sin(angle) * scalar;
  float y9 = offset+100 + sin(angle + 0.4) * scalar;
  float y10 = offset+100 + sin(angle + 0.8) * scalar;
  float y11 = offset+100 + sin(angle + 1.2) * scalar;
  float y12 = offset+100 + sin(angle + 1.2) * scalar;
  float y13 = offset+100 + sin(angle + 0.8) * scalar;
  float y14 = offset+100 + sin(angle + 0.4) * scalar;
  float y15 = offset+100 + sin(angle) * scalar;
  float y16 = offset+100 + sin(angle + 0.4) * scalar;
  
  
  
  text("P", 80, y1);
  line (120, y2, 140, y3);
  text("O", 160, y4);
  line (200, y3, 220, y2);
  text("S", 240, y1);
  line (280, y2, 300, y3);
  text("T", 320, y4);
  
  text("A", 80, y5);
  line (120, y6, 140, y7);
  text("N", 160, y8);
  line (200, y7, 220, y6);
  text("A", 240, y5); 
  line (280, y6, 300, y7);
  text("L", 320, y8);
  line (360, y7, 380, y6);
  text("O", 400, y5);
  line (440, y6, 450, y7);
  text("G", 470, y8);
  stroke(50, 60, 80);

  angle += speed;
}


