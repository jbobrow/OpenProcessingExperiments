
float x, a, corner, theta, sz=80;
int num = 40;
color[] palette = {
  #FF0000, #00FF00, #0000FF
};

void setup() {
  size(500, 500);
  background(0);
  noStroke();
  //blendMode(SCREEN);
}

void draw() {
  background(20);

  translate(width/2, height/2);
  
  for (int i=0; i<num; i++) {
    a = map(sin(theta+(TWO_PI/num)*i), -1, 1, 0, 110);
    sz = map(sin(theta+(TWO_PI/num)*i), -1, 1, 40, 80);
    corner = map(sin(theta+(TWO_PI/num)*i), -1, 1, sz, 0);
    fill(#E80004, a);
    pushMatrix();
    rotate(i*(TWO_PI/num));
    x = map(sin(theta), -1, 1, 0, 60);
    rect(x, 50, 1.8*sz, sz, corner);
    popMatrix();
  }
  theta += 0.0523;

  //if (frameCount%2==0 && frameCount<121) saveFrame("image-###.gif");
}

