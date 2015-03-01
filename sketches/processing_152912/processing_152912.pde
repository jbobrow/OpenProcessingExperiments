
int num = 20, maxSize=400, incr=15;
float theta;

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(0);
  for (int i=0; i<num; i++) {
    float x = map(sin(theta), -1, 1, width/3, width/3*2);
    float y = height/2;
    fill(255, 30);   
    ellipse(x, y, maxSize-incr*i, maxSize-incr*i);
    x = map(sin(theta), -1, 1, width/3*2, width/3);
    ellipse(x, y, maxSize-incr*i, maxSize-incr*i);
  }
  theta += .0523;
  //if (frameCount%3==0 && frameCount<121) saveFrame("image-###.gif");
}

