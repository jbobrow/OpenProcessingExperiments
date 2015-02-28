
int num = 40;
int sw = 1;
float[] offSet = new float[num];
float offSetY = -50;
color bg = #020825;
color s = #54728B;
float theta, th;

void setup() {
  size(400, 400);
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
  stroke(s);

  for (int i=0; i<num; i++) {
    float y = ((height-offSetY)/(num-(num/9)))*i; // trying to get the lines starting off-screen
    float vari = map(sin(theta+offSet[i]), -1, 1, -120, 120);
    bezier(-sw, y+vari,vari, y+vari, width+vari, y-vari, width+sw, y-vari);
  }

  theta += 0.0523;
}

