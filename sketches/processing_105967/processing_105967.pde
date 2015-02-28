
float x;
float y;
float radio = 1;

void setup() {
  size(600, 400);
  background(255);
  smooth();
//  if (frame != null) {
//    frame.setResizable(true);
//  }
}

void draw() {
  background(255);
  for (int i = 0; i <=6 ; i++) { //
    for (int j = 0; j <=6 ; j++) {

      radio=40;
      x = width/7+i*(radio+20);
      y = height/7+j*(radio+20);

      //}

      if (dist(mouseX, mouseY, x-i, y-j) < radio/2) {
        radio = 20;
        noStroke();
        fill(150, 200, 50);
      }
      else {
        noStroke();
        fill(0, 150, 250);
      }

      ellipse(x, y, radio, radio);
    }
  }
}



