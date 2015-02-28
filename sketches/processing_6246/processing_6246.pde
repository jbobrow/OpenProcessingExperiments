
void setup() {
  size(500, 500);


  int y = 0; // Vertical location of each line
  int x = 0; // Initial horizontal location for first line
  int x2 = 0;
  int y2 = 0;
  int spacing = 5; // How far apart is each line
  int len = 500; // Length of each line
  int speed = 1;

  int endLegs = 500;


  strokeWeight(0.5);
  while (x <= endLegs) {
    line(x-len, y, x, y+len);
    x = x + spacing;
  }
  strokeWeight(0.5);
  while (y2 <= endLegs) {
    line(x2+len, y2, x2, y2);
    y2 = y2 + spacing;
  }

}

void draw() {
  int x = 0;
  if (mousePressed == true) {
    if((mouseY <= mouseX) && (mouseX >= mouseY)) {
      fill(255);
      ellipse(mouseX, mouseY, 40, 49); 
    }
    else { 
      fill(0);
      ellipse(mouseX, mouseY, 40, 49);
    }
  } 


}



