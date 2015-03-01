
color f=#ffffff, bg=#202020;
float t, theta, radius=75;
int frames=240, num=10, step;

void setup() {
  size(540, 540,P2D);
  smooth(6);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  step = width/5;
}

void draw() {
  t = (frameCount%frames)/(float)frames;
  background(bg);
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    float col = (360.0/num*i);
    //float offSet = TWO_PI/num*i;
    pushMatrix();
    rotate(TWO_PI/num*i);
    translate(150, 0);
    pushMatrix();
    rotate(PI/2);
    if (t<0.5) {
      float tt=map(t, 0, 0.5, 0, 1); // normalizing the time of the first half of the cycle
      if (tt<.5) {
        fill(col, 90, 90);
        float r = map(tt, 0, 0.5, radius, 0);
        arc(0, 0, radius, r, 0, PI); // moon lower, shrinking
        arc(0, 0, radius, radius, PI, TWO_PI); // moon upper, stable
      } else {
        fill(col, 90, 90);
        arc(0, 0, radius, radius, PI, TWO_PI); // moon upper, stable
        float r = map(tt, 0.5, 1.0, 0, radius);
        fill(bg);
        arc(0, 0, radius, r, PI, TWO_PI); // bg upper, increasing
      }
    } else {
      float tt=map(t, 0.5, 1, 0, 1); // normalizing the time of the second half of the cycle
      if (tt<.5) {
        fill(bg);
        arc(0, 0, radius, radius, PI, TWO_PI); // bg upper, stable
        float r = map(tt, 0, 0.5, radius, 0);
        fill(col, 90, 90);
        arc(0, 0, radius, radius, 0, PI); // moon lower, stable > partly hidden by the following arc
        fill(bg);
        arc(0, 0, radius, r, 0, PI); // bg lower, decreasing
      } else {
        fill(col, 90, 90);
        float r = map(tt, 0.5, 1.0, 0, radius);
        arc(0, 0, radius, radius, 0, PI); // moon lower, stable
        arc(0, 0, radius, r, PI, TWO_PI); // moon upper, increasing
      }
    }
    popMatrix();
    popMatrix();
  }
  theta+=TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

