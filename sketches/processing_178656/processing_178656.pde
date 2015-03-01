
float x=0, d=10, r=0, theta;
int num=100, c, frames=100;
color[] palette = {
  #2D112C, #530031, #820233, #CA293E, #EF4339
};

void setup() {
  size(500, 500);
  background(20);
  frameRate(20);
}

void draw() {
  background(20);
  strokeWeight(2);
  noStroke();
  for (int i=0; i<num; i++) {
    float offSet = TWO_PI/num*i;
    fill(palette[(i+c)%5], 255);
    pushMatrix();
    translate(width/2, height/2);
    rotate(offSet);
    rect(x, 10, 10, 150);
    x=map(sin(theta+offSet*3), -1, 1, 10, 100);
    popMatrix();
  }
  theta +=TWO_PI/frames;
  c++;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}
