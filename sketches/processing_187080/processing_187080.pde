
int num=40, movers=3, d3=25, frames=120;
float angle, theta, d,d2;
color bg=#202020;

void setup() {
  size(540, 540);
}

void draw() {
  randomSeed(455);
  background(bg);
  noFill();
  d = map(sin(theta), -1, 1, 150, 200);
  for (int i=0; i<num; i++) {
    angle = TWO_PI/num*i;
    float outerX = width/2 + cos(angle)*d; 
    float outerY = height/2+sin(angle)*d;
    float cx1 = width/2 + cos(angle)*d*.6; 
    float cy1 = height/2+sin(angle)*d*.8;
    d2 = map(sin(theta), -1, 1, 0, 100);
    for (int j=0; j<movers; j++) {
      float offSet = TWO_PI/movers*j;
      float CmoverX = width/2+cos(theta+offSet)*d2;
      float CmoverY = height/2+sin(theta+offSet)*d2;
      float moverX = CmoverX + cos(angle)*d3;
      float moverY = CmoverY + sin(angle)*d3;
      float cx2 =  CmoverX + cos(angle)*d3*2.8;
      float cy2 = CmoverY + sin(angle)*d3*2.1;
      noFill();
      stroke(#00ffff, 200);
      bezier(outerX, outerY, cx1, cy1, cx2, cy2, moverX, moverY);
      fill(bg);
      ellipse(CmoverX, CmoverY, d3*2, d3*2);
    }
  }
  theta += TWO_PI/frames;
}

