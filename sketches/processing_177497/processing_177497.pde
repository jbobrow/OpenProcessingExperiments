
int num=17, frames=120, step=100, edge=step;
float theta;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(#000000);
  noStroke();
  for (int y=edge; y<=height-edge; y +=step) {
    float j=0;
    for (int x=edge; x<=width-edge; x += step) {
      for (int i=num; i>0; i--) {
        float offSet = TWO_PI/num*i;
        float sz = (5+i*4)*map(sin(theta),-1,1,.3,1);
        pushMatrix();
        translate(x, y);
        float r = map(sin(theta*2+offSet), -1, 1, -PI/6, PI/6);
        rotate(r);
        fill(107, 100, 100-i*6);
        rect(5, 0, sz, sz);
        popMatrix();
      }
      j++;
    }
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

