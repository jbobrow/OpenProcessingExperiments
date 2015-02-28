
PFont f;
int white = 255;
int text1 = 125;
int text2 = 240;
int maxX = 500;
int maxY = 500;

void setup() {
  size(500, 500);
  smooth(); 
  background(white);
  f = createFont("Helvettica", 24, true);
  textFont(f, 24);
  fill(0);
  text("Super Mario Mouse!",text1+12,text2-50);
  text("Hold 'S' for Star Power", text1, text2);
  text("Hold 'C' for Coins", text1+25, text2+50);
  text("Click to Start!", text1+50, text2+100);
}

void draw() {
  if (keyPressed) {
    if (key == 's') {
      translate(mouseX, mouseY);
      noStroke();
      fill(random(white), random(white), random(white), random(white));
      beginShape();
      vertex(0, -50);
      vertex(14, -20);
      vertex(47, -15);
      vertex(23, 7);
      vertex(29, 40);
      vertex(0, 25);
      vertex(-29, 40);
      vertex(-23, 7);
      vertex(-47, -15);
      vertex(-14, -20);
      endShape(CLOSE);
    }
    if (key=='c') {
      strokeWeight(5);
      stroke(215, 175, 25);
      fill(245, 205, 35, 150);
      ellipse(mouseX, mouseY, 75, 75);
    }
  }
}

void mousePressed() {
  background(0);
}


