
int num =20;
float step, sz, offSet, theta;

void setup() {
  size(600, 600);
  stroke(55);
  strokeWeight(5);
  noFill();
  step = 22;
}

void draw() {
  background(20);
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    sz = i*step;
    arc(0, 0, sz, sz, PI, TWO_PI);
  }
  resetMatrix();
  translate(width/2-num/2*step, height/2);
  offSet = -PI/2;
  for (int i=0; i<num*2; i++) {
    int f=i==0 ? 20 : 255;
    stroke(f);
    float endY = map(sin(theta+offSet), -1, 1, 50, num*step/2);
    line(i*step/2, 2, i*step/2, endY);
    offSet += (PI/num);
  }
  theta += .0523;
  //if (frameCount%2==0 && frameCount<121) saveFrame("image-###.gif");
  
}
