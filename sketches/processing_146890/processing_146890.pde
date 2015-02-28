
float x, theta, sz=80;
int num = 30;
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
  background(0);

  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    fill(#02ED4A,100);
    pushMatrix();
    rotate(i*(TWO_PI/num));
    x = map(sin(theta), -1, 1, -120, 80);
    rect(x, 0, 1.8*sz, sz, 10);
    popMatrix();
  }
  theta += 0.0523;

  //if (frameCount%2==0 && frameCount<121) saveFrame("image-###.gif");
}

