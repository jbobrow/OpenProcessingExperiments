
//Kyle Lleses 
//PS1-5

void setup () {
  size (400, 400);
  smooth();
}

void draw() {
  for (int y = 0; y <= height; y += 50) {
    for (int x = 0; x <= width; x += 50) {

      rect (x,y,50,50);
    }
  }
}


