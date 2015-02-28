
void setup() {
  size(500, 500);
  smooth();
  background(255);
  noStroke();
  PFont font;
  font = loadFont("CamilleBD-120.vlw");
  textFont(font);

}

void draw() {
 
}

void mousePressed() {
  alphabet();
  for (int i=0;i<width;i=i+50) {
    for (int j=0; j<height; j=j+50) {
      letters (i, j);
    }
  }
}
void alphabet() {
  fill(random(40, 180), random(20, 120), random(10, 220), random(100, 170));
}



void letters (float x, float y) {
  text("f", x+5, y+60);
}


