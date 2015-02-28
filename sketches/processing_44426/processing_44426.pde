
void setup() {
  size(500, 500);
  smooth();
  background(255);
  noStroke();
  fill(random(40, 180), random(20, 120), random(10, 220), random(100, 170));
  PFont font;
  font = loadFont("CamilleBD-120.vlw");
  textFont(font);
}

void draw() {
  background(255);
  
  for (int i=0;i<width;i=i+50) {
    for (int j=0; j<height; j=j+50) {
      letters (i, j);
    }
  }
}

void mousePressed() {
  fill(random(40, 180), random(20, 120), random(10, 220), random(100, 170));
}




void letters (float x, float y) {
  translate(width/2, height/2);
  rotate(mouseX/float(width) * TWO_PI );
  text("f", x+5, y+60);
}


