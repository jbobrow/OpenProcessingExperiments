
int num=60, step;
float theta, sw;

void setup() {
  size(500, 500);
}

void draw() {
  background(#499601);
  sw=1;
  strokeWeight(sw);
  step=int(float(height)/num);
  for (int i=0; i<num; i++) {
    float s = i*step;
    stroke(#79D100, 100);
    line(s, height, 0, s);
    line(s, 0, height, s);
    line(width,s,width-s,height);
    line(0,height-s,s,0);
  }
  stroke(#F2EA1D);
  sw = (int) map(sin(theta), -1, 1, 280, 150);
  strokeWeight(sw);
  noFill();
  ellipse(width/2, height/2, width*1.2, height*1.2);
  theta += 0.0523/2;
  //if (frameCount%2==0 && frameCount<121) saveFrame("image-###.gif");
}
