
void grid(int x, int y, int w, int h, int n, color c) {
  stroke(c);
  for (int ix=x; ix <= x+w; ix += n) {
    line(ix, y, ix, y+h);
  }

  for (int iy=y; iy <= y+h; iy += n) {
    line(x, iy, x+w, iy);
  }
} 

void grid(int w, int h, int n) {
  strokeWeight(1);
  grid(0,0,w,h,n,color(126,50));
}

