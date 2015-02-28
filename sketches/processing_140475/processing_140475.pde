
int num = 100;
int mod = 5;
float theta, scal, sz = 10;
color[] palette = {
  #ECD078, #D95B43, #C02942, #542437, #53777A
};

void setup() {
  size(500, 500);
  background(20);
}

void draw() {
  background(20);
  noStroke();

  for (int i=0; i<num; i++) {
    float offSet = (TWO_PI/num)*i*3;
    scal = map(sin(theta+offSet), -1, 1, 1, 2.5);
    fill(palette[i%5]);
    float x = width/2;
    float y = (i+.5)*sz*.7;
    float sz1 = ((i%mod)+1.5)*sz*scal;
    ellipse(x, y, sz1, sz*scal);
  }
  theta += 0.0523;

  //if (frameCount%4==0 && frameCount<121) saveFrame("image-###.gif");
}

