
int index=0;
int[][] params={
  {1, 2, 1, 2, 3, 3},
  {2, 1, 2, 1, 3, 3},
  {1, 3, 1, 3, 3, 3},
  {3, 1, 3, 1, 3, 3},
  {1, 4, 1, 4, 3, 3},
  {4, 1, 4, 1, 3, 3},
  {1, 5, 1, 5, 3, 3},
  {5, 1, 5, 1, 3, 3},
  {1, 6, 1, 6, 3, 3},
  {6, 1, 6, 1, 3, 3},
  {1, 7, 1, 7, 3, 3},
  {7, 1, 7, 1, 3, 3},
  {1, 2, 1, 3, 3, 3},
  {1, 3, 1, 2, 3, 3},
  {1, 2, 2, 1, 3, 3},
  {1, 3, 3, 1, 3, 3},
  {1, 80, 1, 80, 3, 3},
  {80, 1, 80, 1, 3, 3},
  {80, 1, 1, 80, 3, 3},
  {1, 100, 1, 50, 3, 3},
  {1, 80, 1, 80, 3, 4},
  {1, 80, 1, 40, 3, 4},
  {1, 60, 1, 120, 3, 4},
  {80, 1, 1, 80, 3, 4},
  {150, 1, 1, 100, 3, 4},
  {1, 200, 1, 150, 3, 4},
  {1, 80, 80, 80, 3, 4},
  {1, 80, 80, 1, 3, 4},
  {9, 100, 200, 9, 3, 4},
  {9, 200, 100, 9, 3, 4},
  {1, 200, 200, 2, 3, 4},
  {2, 200, 200, 1, 3, 4}
};

PFont font;

void setup() {
  //size(128*6, int(128*4.5));
  size(768, 576);
  smooth();
  font=loadFont("Arial-BoldMT-16.vlw");
}

void draw() {
  plot_parm_func(params[index][0], params[index][1], params[index][2], params[index][3], params[index][4], params[index][5], int(height/4.5), PI/2880);
}

void keyPressed() {
  if(++index==params.length) {
    index=0;
  }
}

void mousePressed() {
  if(++index==params.length) {
    index=0;
  }
}

void plot_parm_func(int a, int b, int c, int d, int j, int k, int r, float dt) {
  float x0, x1, y0, y1;
  
  background(255);
  draw_bg();
  stroke(21, 46, 76);
  x0=0;
  y0=0;
  for(float t=dt; t<TWO_PI; t+=dt) {
    x1=cos(a*t)-pow(cos(b*t), j);
    y1=sin(c*t)-pow(sin(d*t), k);
    line(width/2+r*x0, height/2-r*y0, width/2+r*x1, height/2-r*y1);
    x0=x1;
    y0=y1;
  }
  fill(0);
  textFont(font, 16);
  text("x=cos(at)-cos(bt)", 16, 28);
  text("a="+a+", b="+b+", j="+j, width/1.22+16, 28);
  text("y=sin(ct)-sin(dt)", 16, 56);
  text("c="+c+", d="+d+", k="+k, width/1.22+16, 56);
  text("0 <= t < 2π", 16, 84);
  text("j", 138, 20);
  text("k", 126, 48);
}

void draw_bg() {
  for(int i=0; i<width/8; i++) {
    for(int j=0; j<height/8; j++) {
      set(i*8, j*8, color(192, 192, 192));
      set(4+i*8, 4+j*8, color(192, 192, 192));
    }
  }
  stroke(192, 192, 192, 128);
  for(int i=1; i<=width/128; i++) {
    line(i*128, 0, i*128, height);
  }
  for(int j=1; j<=height/128; j++) {
    line(0, height-j*128, width, height-j*128);
  }
  stroke(21, 46, 76);
  strokeWeight(4);
  noFill();
  rect(0, 0, width-1, height-1);
  strokeWeight(1);
}
