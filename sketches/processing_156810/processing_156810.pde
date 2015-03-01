
int s = 8;
 
color c;
int hue = 0;
 
 
void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);
}
 
void draw() {
  background(360);
 
  noStroke();
  fill(hue, 50, 100);
 
  for (int i = 0; i < width/s*4;i++) {
    for (int j = 0; j < height/s*4;j++) {
      hounds_tooth(i*s*4-s, s*4*j+s*2);
    }
  }
 
  hue += 4;
  if (hue > 360) {
    hue = 0;
  }
}
 
void hounds_tooth(int x, int y) {
  pushMatrix();
  translate(x, y);
 
  beginShape();
  vertex(0, 0);
  vertex(s*2, -s*2);
  vertex(s*3, -s*2);
  vertex(s*4, -s*3);
  vertex(s*4, -s*2);
  vertex(s*5, -s*2);
  vertex(s*4, -s);
  vertex(s*4, 0);
  vertex(s*2, s*2);
  vertex(s*2, s);
  vertex(s*3, 0);
  vertex(s*2, 0);
  vertex(s*2, -s);
  vertex(s, 0);
  endShape();
 
  popMatrix();
}



