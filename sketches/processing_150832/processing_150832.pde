
int columns=15;
int rows = columns;
float gap, theta, theta2;
color[] palette = {
  #BD1550, #E97F02, #F8CA00, #8A9B0F
};
color bg = #490A3D;

void setup() {
  size(500, 500);
  strokeWeight(2);
  gap=width/columns;
}

void draw() {
  background(bg);
  float theta2=PI/6;

  for (int j=0; j<rows; j++) {
    stroke(palette[j%palette.length], 220);
    fill(palette[j%palette.length], 170);
    theta2 += (TWO_PI/12);
    float offSetY = map(sin(theta2), -1, 1, 0, TWO_PI);
    for (int i=0; i<columns; i++) { 
      float offSetX = (TWO_PI/rows*i);
      float x = (.5+i)*gap;
      float y = (.5+j)*gap;

      float sz = map(sin(theta+offSetX+offSetY), -1, 1, 5, gap*1.5);
      ellipse(x, y, sz, sz);
    }
  }
  theta -= .0523;

  //if (frameCount % 3 == 0 && frameCount<121) saveFrame("image-####.gif");
}
