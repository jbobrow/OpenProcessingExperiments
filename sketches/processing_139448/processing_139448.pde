
int s;
int small = 4;
int big = 300;
int c=-small;
int d=big;
int wh = 600;

void setup() {
  size(wh, wh);
  s = width/2;
  colorMode(HSB, 255);
  background(0, 0, 0);
}

void draw() {
  fill(0, 0, 0, 30);
  noStroke();
  strokeWeight(2);
  rect(0, 0, width, height);
  stroke(map(s, 0, width/2, 0, 255), 255, 255,200);
  fill(map(s, 0, width/2, 0, 255), 255, 255, 1);

  ellipse(width/4, height/4, s, s);
  ellipse(3*width/4, height/4, s, s);
  ellipse(width/4, 3*height/4, s, s);
  ellipse(3*width/4, 3*height/4, s, s);
  ellipse(width/2, height/2, s, s);
  ellipse(width/2, height/4, s, s);
  ellipse(width/2, 3*height/4, s, s);
  ellipse(width/4, height/2, s, s);
  ellipse(3*width/4, height/2, s, s);

  stroke(abs(map(s, 0, width/2, 0, 255)-255), 255, 200);
  ellipse(width/3, height/3, d, d);
  ellipse(2*width/3, 2*height/3, d, d);
  ellipse(width/3, 2*height/3, d, d);
  ellipse(2*width/3, height/3, d, d);

  s+=c;
  if (s<small) {
    c*=-1;
  }
  if (s>width/2) {
    c*=-1;
  };

  d-=c;
  if (d<small) {
    d*=-1;
  }
  if (d>width/2) {
    d*=-1;
  }
  //saveFrame("frames/####.jpg");
}






