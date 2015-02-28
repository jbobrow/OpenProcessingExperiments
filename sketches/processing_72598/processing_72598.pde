
size(800, 800);
smooth();

stroke(0);
for (float y=0; y<height; y+=float(height)/100.0) {
float x0=0, y0=y;
  for (float x=0; x<width; x++) {
    float x1 = x;
    float y1 = y+(y/20.0)*sin(2*PI*6*x/width);
    line(x0, y0, x1, y1);
    x0=x1;
    y0=y1;
  }
}
