
int stro = 0;
int brush = 1;
int r = 0, g = 0, b = 0;
int wid = 30, hei = 30;

void setup() {
  size(800, 800);
}

void clear() {
  background(204);
}

void draw() {
  if (mousePressed == true) {
    if (brush == 1) {
      strokeWeight(stro);
      stroke(r, g, b);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
    else if (brush == 2) {
      noStroke();
      fill(r, g, b);
      for (int i = 0; i < 6; i++) {
        ellipse(mouseX + i*i*i, mouseY + i*i, i*3, i*3);
      }
    }
    else if (brush == 3) {
      noStroke();
      pushMatrix();
      fill(random(255), random(255), random(255));
      if (mouseButton == RIGHT) {
        rotate(random(25));
      }
      wid += 0.1;
      hei += 0.1;
      rect(mouseX, mouseY, wid, hei);
      popMatrix();
    }
  }
}

void keyPressed() {
  switch(key) {
  case '1':
    brush = 1;
    break;
  case '2':
    brush = 2;
    break;
  case '3':
    brush = 3;
    break;
  case 'c':
    background(204);
    wid = 30; hei = 30; r = 0; g = 0; b = 0;
    break;
  case '+':
    stro++;
    break;
  case '-':
    stro--;
    break;
  }
}

void keyReleased() {
  switch(key) {
  case 'b':
    r = 0; g = 0; b = 255;
    break;
  case 'g':
    r = 0; g = 255; b = 0;
    break;
  case 'r':
    r = 255; g = 0; b = 0;
    break;
  case 'n':
    r = 0; g = 0; b = 0;
  }
}



