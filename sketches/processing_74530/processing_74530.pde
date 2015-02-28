
void setup() {
  size(400, 400, P2D);
  smooth (4);
}


void draw () {
  //background(181, 205, 229);
  for (int y = 0; y <= height; y = y +50) {
   for(int x = 0; x <= width; x = x + 50){
     noStroke();
     fill(78, 74, 216, 150);
     rect (x, y, 20, 20);
     fill(178, 145, 13);
     rect (x, y, 10, 20 );
     }
  }
  
}
