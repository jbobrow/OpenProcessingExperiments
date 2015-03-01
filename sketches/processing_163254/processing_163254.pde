


void setup() {
  size(700, 700);
  
}


void draw() {
  smooth();
  background(0);
  noStroke();
  for (float o = 0.5; o < 48; o++) {
    if (o < 3) {
      fill(250, 128, 114);
    } else if (o < 6) {
      fill(218, 165, 32);
    } else if (o < 9) {
      fill(0, 153, 51);
    } else if (o < 12) {
      fill(32, 121, 154);
    } else if (o < 15) {
      fill(127, 219, 253);
    } else if (o < 18) {
      fill(29, 259, 88);
    } else if (o < 21) {
      fill(255, 215, 0);
    } else if (o < 24) {
      fill(240, 230, 140);
    }
    for (float k = 0; k < 24; k++) {

      dEllipse(o * 30, k * 30);
    }
  }


  for (float i = 0; i < 24; i++) {
    if (i < 3) {
      stroke(32, 121, 154);
      fill(127, 219, 253);
    } else if (i < 6) {
      noStroke();
      fill(32, 121, 154);
    } else if (i < 9) {
      stroke(29, 249, 88);
      fill(0, 153, 51);
    } else if (i < 12) {
      noStroke();
      fill(29, 249, 88);
    } else if (i < 15) {
      stroke(218,165,32);
      fill(255, 215, 0);
    } else if ( i < 18) {
      noStroke();
      fill(218, 165, 32);
    } else if (i < 21) {
      fill(250, 128, 114);
    } else if ( i< 24) {
      stroke(250, 128, 114);
      fill(240, 230, 140);
    }
    for (float j = 0; j < 12; j++) {

      rSquare(i * 30, j * 30);
    }
  }
}

void rSquare(float x, float y) {
  rect(x, y, 30, 30, 10);
}

void dEllipse(float x, float y) {
  ellipse(x, y, 30, 30);
}



