
float a ;
float b ;
float col ;
float scol = 1 ;
 
void setup(){
    size(500,500);
    background(255);
    smooth();
    colorMode(HSB);
}


void draw() {
  float x0 = map(sin(a), -1, 1, 20, width - 20); 
  float y0 = map(cos(a), -1, 1, 20, height - 20);
  float x1 = map(sin(b), -1, 1, 20, width - 20);
  float y1 = map(cos(b), -1, 1, 10, height - 20);
  strokeWeight(2);
  stroke(col, 100, 205, 10);
  line (x0, y0, x1, y1);
  a = a + 0.03;
  b = b + 0.04; 
  col += scol ; 
  if (col > 255 ) {
    scol += scol * -1 ;
  }
}
