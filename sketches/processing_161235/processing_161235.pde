
int num = 20;
float theta; 
int maxFrameCount = 120;
float t;

void setup() {
  size(500, 500);
  rectMode(CENTER);
}

void draw() {
  background(#182A67);
  noStroke();
  noFill();
  t = (float)frameCount/maxFrameCount;
  theta = TWO_PI*t;
  translate(width/2, height/2);
  pushMatrix();
  rotate(theta/num);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float offSet = TWO_PI/num*i; 
    rotate(offSet);
    float sz = map(sin(theta+offSet), -1, 1, 5, 50);
    float x = 180;
    //stroke(255);
    fill(255);
    ellipse(x, 0, sz, sz);
    //fill(#182A67);
    ellipse(x, 0, sz*.5, sz*.5);

    float sz2 = map(sin(-theta+offSet), -1, 1, 5, 30);
    float x2 = 110;
    //stroke(255);
    //fill(255);
    ellipse(x2, 0, sz2, sz2);
    //fill(#182A67);
    ellipse(x2, 0, sz2*.5, sz2*.5);

    popMatrix();
  }
  popMatrix();
  //if (t<=1.0) saveFrame("image-###.gif");
}
