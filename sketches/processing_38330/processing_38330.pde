
               void setup() {
  size(500, 500);  
  smooth();
}

void draw() {
  background(0);
  int space = 25;
  int sx = 10;
  int sy = 0;
  int ex = 500;
  int ey = 10;
  stroke(90, 218, 222);
  strokeWeight(1);
  for (int i = 1; i <= 10; i++) {
    line(sx+(i*space), sy, ex, ey+(i*space));
    sx += space;
    ey += space;
  }
}               
