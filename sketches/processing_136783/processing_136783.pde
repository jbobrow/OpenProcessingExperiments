
int num = 50;
int sw = 1;
float[] offSet = new float[num];
float offSetY = -50;
color bg = #361826;
color s = #ffffff;
float theta, th;

void setup() {
  size(500, 500);
  background(bg);
  noFill();
  strokeWeight(sw);

  for (int i=0; i<num; i++) {
    offSet[i]=th;
    th += (TWO_PI/num);
  }
}

void draw() {
  translate(0, offSetY);
  background(bg);
  stroke(s, 150);

  for (int i=0; i<num; i++) {
    float y = ((height-offSetY)/(num-(num/9)))*i; // trying to get the lines starting off-screen
    float vari = map(sin(theta+offSet[i]), -1, 1, -120, 120);
    bezier(-sw, y, 0, y+vari, width, y-vari, width+sw, y);
  }
  theta += 0.0523;
}

