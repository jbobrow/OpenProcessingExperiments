
//Kyle Lleses 
//PS1-7

void setup () {
  size (500, 500);
  background (0);
  smooth();
}

void draw() {
  fill (255, 20, 147);
  for (int y = 0; y <= height; y += 500) {
    for (int x = 0; x <= width; x += 20) {

      rect (mouseX,y,50,500);
    }
  }
}


