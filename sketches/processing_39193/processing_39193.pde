
void setup() {
  size(400, 400);
  smooth();
  background(255);
}

void draw() {
  for (int a=0; a<=width; a+=50) {
    for (int b=0; b<=height; b+=50) {
      float ran=random(4);
      if (ran>2) {
        Kvadrat(a, b); //square
      }
      else {
        Krog(b, a); //circle
      }
      Linea(a, b); //line
      //The variables are written so as not to be mistaken for command words.
      //They are the same words in a different language
    }
  }
  noLoop();
}

void Kvadrat(float x, float y) {
  pushMatrix();
  translate(x, y);
  rectMode(CORNERS);
  fill(0, 0, 255, 99); //slightly transparent blue
  stroke(0);
  rect(-20, -20, 25, 25);
  popMatrix();
}

void Krog(float x, float y) {
  pushMatrix();
  translate(x, y);
  ellipseMode(CORNER);
  fill(0, 150, 0); //green
  stroke(0);
  ellipse(-20, -20, 45, 45);
  popMatrix();
}

void Linea(float x, float y) { 
  //this gives out crossed lines, diagonal to the grid
  //each line intersects the center of the circles and rectangles
  pushMatrix();
  translate(x, y);
  stroke(255, 0, 0);
  line(0, 55, 55, 0);
  line(0, 0, 55, 55);
  popMatrix();
}


