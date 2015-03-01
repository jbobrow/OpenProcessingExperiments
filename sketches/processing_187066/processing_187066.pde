
int num=40, movers=2, d=200, d2=100, d3=25, frames=240;
float angle, theta;

void setup() {
  size(750, 540);
}

void draw() {
  background(20);
  noFill();
  for (int i=0; i<num; i++) {
    angle = TWO_PI/num*i;
    float outerX = width/2 + cos(angle)*d; 
    float outerY = height/2+sin(angle)*d;
    float cx1 = width/2 + cos(angle)*d*.6; 
    float cy1 = height/2+sin(angle)*d*.8;
    for (int j=0; j<movers; j++) {
      float offSet = TWO_PI/movers*j;
      float CmoverX = width/2+cos(theta+offSet)*d2;
      float CmoverY = height/2+sin(theta+offSet)*d2;
      float moverX = CmoverX + cos(angle)*d3;
      float moverY = CmoverY + sin(angle)*d3;
      float cx2 =  CmoverX + cos(angle)*d3*2.8;
      float cy2 = CmoverY + sin(angle)*d3*2.1;
      noFill();
      stroke(255, 200);
      bezier(outerX, outerY, cx1, cy1, cx2, cy2, moverX, moverY);
      fill(20);
      //noStroke();
      ellipse(CmoverX, CmoverY, d3*2, d3*2);
    }
  }
  theta += TWO_PI/frames;

  //if (frameCount<=frames/movers) saveFrame("image-###.gif");
}

