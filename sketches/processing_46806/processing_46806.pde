
void setup () {
  size (500,450);
  background (190);
  smooth();
  noLoop();
  noStroke();
}

void draw () {
   for ( int i = 15; i < height; i += 15) {
    for (int f = 10; f < width; f += 40) { 
      line ( i, 400, f, 60);
      stroke (10);
              }}}
                            
