

int grootte = 10;

void setup() {
  size(640, 640);

  noStroke();
}

void draw() {
  if (keyPressed) {
    print(key);

    if (key == '1') {
      fill(254, 125, 18, 10);
    }
    if (key == '2') {
      fill(23, 125, 108, 10);
    }

    if (key == '=') {
      grootte = grootte + 2;
    }

    if (key == '-') {
      grootte = grootte - 2;
    }
  } 

  // zorg er voor dat de grootte binnen 5 en 250 blijft
  grootte = constrain(grootte, 5, 250);

  if (mousePressed) {
    // teken een rondje bij de muis
    ellipse(mouseX, mouseY, grootte, grootte);
  }
}



