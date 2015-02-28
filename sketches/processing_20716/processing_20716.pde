
//Kyle Lleses 
//PS1-6

void setup () {
  size (400, 400);
  smooth();
}

void draw() {
  for (int y = 0; y <= height; y += 50) {
    for (int x = 0; x <= width; x += 50) {

      if ((y+x) %20 ==0) {
        fill (251, 215, 0);
      }

      else {
        fill (0);
      }

      rect (x,y,50,50);
    }
  }
}


