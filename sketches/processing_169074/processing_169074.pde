
PFont f1;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  colorMode(HSB,360,100,100);
  f1 = loadFont("HiraMinProN-W6-150.vlw");

  translate(width/2, height/2);
  for (int i=0; i<150; i++) {
    textFont(f1);
    float y = map(i,0,149, 0,100);
    fill(189, y, 100);
    textSize(i+2);
    rotate(radians(30));
    text("XY", i, i);
  }
  
}
