
void setup() {
  size(800, 800);
}



void draw() {

  //transparent background  
  fill(255, 255, 255, 10);
  rect(-10, -10, 2400, 2400);

  //command text
  fill(50);
  textSize(20);
  text("Commands", 10, 20);
  textSize(12);
  text("l - line", 10, 45);
  text("s - square", 10, 60);
  text("c - circle", 10, 75);
  text("y - yellow", 10, 105);
  text("g - green", 10, 120);
  text("b - blue", 10, 135);

  //colors
  
  if (key =='b') {
    fill(#1A9DFF);
    stroke(#1A9DFF);
  }

  if (key =='y') {
    fill(#FEC436);
    stroke(#FEC436);
  }

  if (key =='g') {
    fill(#2AB69D); 
    stroke(#2AB69D);
  }

  strokeWeight(4);

  //shapes
  if (key == 'c') {
    drawCircle(mouseX, mouseY);
  }

  if (key == 's') {
    drawSquare(mouseX, mouseY);
  }

  if (key == 'l') {
    drawLine(mouseX, mouseY);
  }

}




//functions

void drawSquare(int theX, int theY) {
  float size = (pmouseX-mouseX);
  rectMode(CENTER);
  rect(theX, theY, size, size);
}

void drawCircle(int theX, int theY) {
  float size = (pmouseX-mouseX);
  ellipse(theX, theY, size, size);
}

void drawLine(int theX, int theY) {
  line(pmouseX, pmouseY, theX, theY);
}

