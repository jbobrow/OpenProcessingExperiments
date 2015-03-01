
int num=15, movers=3, d=200, d2=120, frames=300;
float angle, theta;

void setup() {
  size(540, 540);
  //smooth(5);
  stroke(255,180);
}

void draw() {
  background(20);
  for (int i=0; i<num; i++) {
    float outerX = width/2 + cos(angle)*d; 
    float outerY = height/2+sin(angle)*d;
    point(outerX, outerY);
    angle = TWO_PI/num*i;
    for (int j=0; j<movers; j++) {
      float offSet = TWO_PI/movers*j;
      float moverX = width/2+cos(theta+offSet)*d2;
      float moverY = height/2+sin(theta+offSet)*d2;
      line(outerX, outerY, moverX, moverY);
    }
  }
  theta += TWO_PI/frames;
  
  //if (frameCount<=(frames/movers)+1) saveFrame("image-###.gif");
}

