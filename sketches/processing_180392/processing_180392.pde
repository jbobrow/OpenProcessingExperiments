
int frames = 220, num=30;
float theta;

void setup() {
  size(750, 750);
}

void draw() {
  background(20);
  stroke(#9EC3CE, 255);
  strokeWeight(2);
  noFill();
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float offSet=TWO_PI/num*i;
    rotate(offSet);
    float sz = map(sin(theta),-1,1,width*.15,width*.2);
    float x = map(sin(theta), -1, 1, sz, width*.2);
    translate(x, 0);
    pushMatrix();
    rotate(theta);
    if (i%2==0) {
      ellipse(0, 0, sz, sz*2);
    } else {
      ellipse(0, 0, sz*.7, sz*2*.7);
    }
    popMatrix();
    popMatrix();
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

