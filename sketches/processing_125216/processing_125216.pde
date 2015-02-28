
//interkas
int x, y;
float a, b, c, d, e, f;

PFont font;

void setup() {
  size(800, 400); 
  font = loadFont("font.vlw");
  textFont(font, 24);
  textAlign(CENTER);
  stroke(255);
  frameRate(16);
}


void draw() {
  background(0);
  x = mouseX;
  y = mouseY;
  textFont(font, 72);
  if (mouseX > 6*width/28 && mouseX < 8*width/28) {
    text("i", 7*width/28, height/2);
  }
  else {
    for (int i = 0; i < 10; i++) {
      a = random(6*width/28, 8*width/28);
      b = random(6*width/28, 8*width/28);
      c = random(6*width/28, 8*width/28);
      d = random(7*width/28, height/2);
      e = random(7*width/28, height/2);
      f = random(7*width/28, height/2);
      line(a, d, b, e);
      line(b, e, c, f);
      line(c, f, a, d);
    }
  }
  if (mouseX > 8*width/28 && mouseX < 10*width/28) {
    text("n", 9*width/28, height/2);
  }
  else {
    for (int i = 0; i < 10; i++) {
      a = random(8*width/28, 10*width/28);
      b = random(8*width/28, 10*width/28);
      c = random(8*width/28, 10*width/28);
      d = random(9*height/28, height/2);
      e = random(9*height/28, height/2);
      f = random(9*height/28, height/2);
      line(a, d, b, e);
      line(b, e, c, f);
      line(c, f, a, d);
    }
  }
  if (mouseX > 10*width/28 && mouseX < 12*width/28) {
    text("t", 11*width/28, height/2);
  }
  else {
    for (int i = 0; i < 10; i++) {
      a = random(10*width/28, 12*width/28);
      b = random(10*width/28, 12*width/28);
      c = random(10*width/28, 12*width/28);
      d = random(9*height/28, height/2);
      e = random(9*height/28, height/2);
      f = random(9*height/28, height/2);
      beginShape(LINES);
      vertex(a, d, b, e);
      vertex(b, e, c, f);
      vertex(c, f, a, d);
      endShape();
    }
  }
  if (mouseX > 12*width/28 && mouseX < 14*width/28) {
    text("e", 13*width/28, height/2);
  }
  else {
    for (int i = 0; i < 10; i++) {
      a = random(12*width/28, 14*width/28);
      b = random(12*width/28, 14*width/28);
      c = random(12*width/28, 14*width/28);
      d = random(9*height/28, height/2);
      e = random(9*height/28, height/2);
      f = random(9*height/28, height/2);
      beginShape(POINTS);
      vertex(a, d, b, e);
      vertex(b, e, c, f);
      vertex(c, f, a, d);
      endShape();
    }
  }
  if (mouseX > 14*width/28 && mouseX < 16*width/28) {
    text("r", 15*width/28, height/2);
  }
  else {
    noFill();
    for (int i = 0; i < 10; i++) {
      a = random(14*width/28, 16*width/28);
      b = random(14*width/28, 16*width/28);
      c = random(14*width/28, 16*width/28);
      d = random(9*height/28, height/2);
      e = random(9*height/28, height/2);
      f = random(9*height/28, height/2);
      beginShape();
      vertex(a, f);
      vertex(b, e);
      vertex(c, d);
      vertex(b, d);
      vertex(c, e);

      endShape(CLOSE);
    }
  }
  if (mouseX > 16*width/28 && mouseX < 18*width/28) {
  }
  else 
    text("k", 17*width/28, height/2);

  if (mouseX > 18*width/28 && mouseX < 20*width/28) {
  }
  else 
    text("ä", 19*width/28, height/2);

  if (mouseX > 20*width/28 && mouseX < 22*width/28) {
  }
  else 
    text("s", 21*width/28, height/2);
  textFont(font, 24);
  text("coming soon // kommt bald", width/2, 5*height/8); // ag teacht go luath
}



