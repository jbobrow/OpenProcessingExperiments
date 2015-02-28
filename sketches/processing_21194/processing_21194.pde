
void setup() {
  size(400,400);
  background(153);
  gridMNC(0,0,3,3,400/3,color(random(0,255),220,70),random(0,100), random(1,10));
  gridMNC(0,0,3,3,(400/3)/3,color(random(0,255),220,70), random(0,100),random(1,10));
  gridMNC(400/3,0,3,3,(400/3)/3,color(random(0,255),220,70),random(0,100),random(1,10));
  gridMNC(0,400/3,3,3,(400/3)/3,color(random(0,255),220,70),random(0,100),random(1,10));
  gridMNC(400/3,400/3,3,3,(400/3)/3,color(random(0,255),220,70),random(0,100),random(1,10));
  gridMNC(800/3,800/3,3,3,(400/3)/3,color(random(0,255),220,70),random(0,100),random(1,10));
  gridMNC(800/3,0,3,3,(400/3)/3,color(random(0,255),220,70),random(0,100),random(1,10));
  gridMNC(800/3,400/3,3,3,(400/3)/3,color(random(0,255),220,70),random(0,100),random(1,10));
  gridMNC(400/3,800/3,3,3,(400/3)/3,color(random(0,255),220,70),random(0,100),random(1,10));
  gridMNC(0,800/3,3,3,(400/3)/3,color(random(0,255),220,70),random(0,100),random(1,10));
 // noLoop();
}

void draw() {
  
  if(second()%2 == 0){ 
    setup();
  }
}

// grid of given #row/#column

void gridMNC(int x0, int y0, int mrow, int ncol, int cellw, color c, float n, float w) { 
 
  stroke(c, n); 
  strokeWeight(w);

  int x1=x0+ncol*cellw;
  int y1=y0+mrow*cellw;
  for (int i=0, iy=y0; i<=mrow; i++, iy+=cellw) line(x0, iy, x1, iy);
  for (int i=0, ix=x0; i<=ncol; i++, ix+=cellw) line(ix, y0, ix, y1);
}



