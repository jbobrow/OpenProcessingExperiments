

int num = 300;
 //Dot matrix
Style[] myStyle = new Style [num];
 //form origin of dot matrix
void setup() {
  
  background(100);
  size(700,700);
  frameRate(45);
  smooth();
 
  for (int i = 0; i < myStyle.length; i++) {
    myStyle[i] = new Style();
  }
}
 //Dots wrok as my style when used against background
void draw() {
 
  for (int i = 0; i < myStyle.length; i++) {
    myStyle[i].update();
    myStyle[i].display();
  }
}
 
// stop the infestation by pressing the mouse
void mousePressed() {
  noLoop();
}
 
class Style {
 
  int x = int(random(width));
  int y = int(random(height));
 
  Style() {
  }
  void update() {
    x = x + int(random(2, 4));
    y = y + int(random(2, 4));
  }
 //randomization of the dots
  void display() {
    ellipse(random(x), random(y), 45, 45);
  }
}


