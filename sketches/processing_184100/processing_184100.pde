
int num=30, numFrames=180;
float theta;

void setup() {
  size(500, 500);
  noStroke();
}


void draw() {
  background(0);
  eruption(#FF8000, 35, 0, 0);
  eruption(#000000, 255, 120, 20);
  theta += TWO_PI/numFrames;
  //if (frameCount<=numFrames) saveFrame("image-###.gif");
}

void eruption(color f, int alpha, int off1, int off2) {
  for (int i=0; i<num; i++) {
    fill(f, alpha);
    float offSet = TWO_PI/num*i;
    float d=map(sin(theta+offSet), -1, 1, 0.5, 10);
    float d2=map(sin(theta+offSet), -1, 1, 340-off1, 80-off2);
    float h=50+i*d;
    float w=d2;
    float x1 = width/2-w/2;
    float y1 = height*.8;
    float x2 = width/2;
    float y2 = height*.8-h;
    float x3 = width/2+w/2;
    float y3 = height*.8;
    beginShape();
    vertex(x1, y1);
    vertex(x2, y2);
    vertex(x3, y3);
    endShape(CLOSE);
  }
}
