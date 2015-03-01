
color f=#ffffff, bg=#202020;
float t, theta, radius=200;
int frames=480;

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  t = (frameCount%frames)/(float)frames;
  background(bg);
  translate(width/2, height/2);
  rotate(PI/2);
  if (t<0.5) {
    float tt=map(t,0,0.5,0,1); // normalizing the time of the first half of the cycle
    if (tt<.5) {
      fill(f);
      float r = map(tt, 0, 0.5, radius, 0);
      arc(0, 0, radius, r, 0, PI); // moon lower, shrinking
      arc(0, 0, radius, radius, PI, TWO_PI); // moon upper, stable
    } else {
      fill(f);
      arc(0, 0, radius, radius, PI, TWO_PI); // moon upper, stable
      float r = map(tt, 0.5, 1.0, 0, radius);
      fill(bg);
      arc(0, 0, radius, r, PI, TWO_PI); // bg upper, increasing
    }
  } else {
    float tt=map(t,0.5,1,0,1); // normalizing the time of the second half of the cycle
    if (tt<.5) {
      fill(bg);
      arc(0, 0, radius, radius, PI, TWO_PI); // bg upper, stable
      float r = map(tt, 0, 0.5, radius, 0);
      fill(f);
      arc(0, 0, radius, radius, 0, PI); // moon lower, stable > partly hidden by the following arc
      fill(bg);
      arc(0, 0, radius, r, 0, PI); // bg lower, decreasing
    } else {
      fill(f);
      float r = map(tt, 0.5, 1.0, 0, radius);
      arc(0, 0, radius, radius, 0, PI); // moon lower, stable
      arc(0, 0, radius, r, PI, TWO_PI); // moon upper, increasing
    }
  }
  theta+=TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

