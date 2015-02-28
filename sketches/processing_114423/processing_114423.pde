
void setup() {
  size(650, 450);
  smooth();
  background(230);
  noStroke();
}

void draw() {
  float x = mouseX;
  float y = mouseY;


  // triangle
  if (x > 93 && x < 278 && y > 110 && y < 265 ) {
    fill(0);
    triangle(185, 110, 93, 265, 278, 265);
  }

  else {
    fill(255);
    triangle(185, 110, 93, 265, 278, 265);
  }
  //ellipse

  if (x > 390 && x < 545 && y > 110 && y < 265) {
    fill(0);
    ellipse(468, 178, 155, 155);
  }

  else {
    fill(255);
    ellipse(468, 178, 155, 155);
  }

// help on move the curser around the boundery

  if (x > 390 && x < 545 && y > 110 && y < 265 && mousePressed) {
    fill(250);
    ellipse(x, y, 155, 155);
    x += 1;
    y += 1;
    
    
  }
}




