
color circle1 = color(37, 126, 183);
color circle2 = color(255, 85, 0);
color circle3 = color(255, 85, 0);

void setup() {
  background(174, 227, 220);
  size(500, 500);
}

void draw() {
  //background (50);
  if (mousePressed) {
    makewp (mouseX, mouseY);
  }

  if (keyPressed) {

    switch(key) {
    case ' ':
      background(174, 227, 220);
      break;
    case '1':
      fill (0);
      break;
    }

    if (key == ' ') {
      background (174, 227, 220);
      ;
    }
    if (key == '1') {
      circle2 = color(255, 200, 200);
      circle3 = color(255, 200, 200);
    }
    if (key == '2') {
      circle1 = color(255, 200, 200);
      circle2 = color(240, 22, 22);
      circle3 = color(240, 22, 22);
    }
    if (key == '3') {
      circle1 = color(255, 200, 200);
      circle2 = color(37, 126, 183);
      circle3 = color(37, 126, 183);
    }
    if (key == '4') {
      circle1 = color(240, 22, 22);
      circle2 = color(255, 85, 0);
      circle3 = color(255, 85, 0);
    }

    if (key == '5') {
      circle1 = color(255, 85, 0);
      circle2 = color(181, 224, 183);
      circle3 = color(181, 224, 183);
    }

    if (key == '6') {
      circle1 = color(255, 200, 200);
      circle2 = color(255, 200, 200); 
      circle3 = color(255, 200, 200);
    }

    if (key == '7') {
      circle1 = color(181, 224, 183);
      circle2 = color(181, 224, 183);
      circle3 = color(181, 224, 183);
    }
    if (key == '8') {
      circle1 = color(37, 126, 183);
      circle2 = color(37, 126, 183);
      circle3 = color(37, 126, 183);
    }

    if (key == '9') {
      circle1 = color(181, 224, 183);
      circle2 = color(240, 22, 22);
      circle3 = color(240, 22, 22);
    }

    if (key == '0') {
      circle1 = color(37, 126, 183);
      circle2 = color(255, 85, 0);
      circle3 = color(255, 85, 0);
    }
  }
}


void makewp (float x, float y) {
  for (int j = 0; j <= 500; j = j+50) { //even set of circles that fit on page
    for (int i=0; i <= 500; i = i+50) {
      fill (circle1);
      ellipse  (x, y, 10, 10);
    }
  }
  for (int m=0; m<=500; m= m+50) { //odd set of circles that go off page and in between 10
    for (int n=0; n<=500; n = n+50) {
      fill (circle2);
      ellipse (x+20, y+20, 10, 10);
    }
  }
  for (int v=0; v<=500; v=v+50) {
    for (int z=0; z <=500; z=z+50) {
      fill (circle3);
      ellipse (x+20, y-20, 10, 10);
    }
  }
}

                
                
