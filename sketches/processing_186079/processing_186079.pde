
int num = 240, frames=120;
float theta, yStart;

void setup() {
  size(750, 540);
  noFill();
  strokeCap(SQUARE);
}

void draw() {
  background(#202020);
  translate(width/2, height/2);
  strokeWeight(2);
  stroke(#ffffff, 200);
  noStroke();
  for (int i=0; i<num; i++) {
    fill(#00D140, 10);
    pushMatrix();
    float offSet = TWO_PI/num*i;
    rotate(offSet+PI/100*i);
    float sz = map(sin(theta+offSet*(num/40)), -1, 1, 50, 180);
    float x = map(sin(theta), -1, 1, 20, 160);
    float start = theta;
    float end = start + PI/2;
    yStart = width*.1;
    arc(x, yStart, sz, sz, start, end);
    popMatrix();
  }   
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

