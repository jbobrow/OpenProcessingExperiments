
// SIMONE ROTH, checkerboard, PS1_5 //

int size = 50;

void setup () {
  size (400, 400);
  stroke(234);
  smooth();
}
 
void draw() {
  for (int a = 0; a < height; a += size) {
    for (int b = 0; b < width; b += size) {
 
      if ((a+b) %20 ==0) {
        fill (247, 204, 122);
      }
 
      else {
        fill (250, 240, 222);
      }
 
      rect (a,b,50,50);
    }
  }
}


