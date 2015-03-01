
int columns=15;
int rows = columns;
float gap, theta, theta2;
color[] palette = {
  #838689, #A8CABA, #CAD7B2, #EBE3AA
};
color bg = #5D4157;

void setup() {
  size(500, 500);
  strokeWeight(2);
  gap=width/columns;
}

void draw() {
  background(bg);
  float theta2=PI/6;
  for (int i=0; i<columns; i++) {
    stroke(palette[i%palette.length], 220);
    fill(palette[i%palette.length], 170);
    theta2 += (TWO_PI/12);
    float offSetX = map(sin(theta2), -1, 1, 0, TWO_PI);
    for (int j=0; j<rows; j++) {
      float x = (.5+i)*gap;
      float y = (.5+j)*gap;
      float offSetY = (TWO_PI/rows*j);
      float sz = map(sin(theta+offSetX+offSetY), -1, 1, 5, gap*1.5);
      ellipse(x, y, sz, sz);
    }
  }
  theta -= .0523;

  //if (frameCount % 3 == 0 && frameCount<121) saveFrame("image-####.gif");
}

