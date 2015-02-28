
// 2014 Kris Strong
// Experiment with code from tutorial
// based on http://funprogramming.org/3-Create-an-animation-use-random.html

void setup () {
  size(500, 500);
  background(#EC7263);
  strokeWeight(5);
  noLoop();
}

void draw() {
  linie();
  linie();
}

void linie() {
  stroke(#5C2849); //fiolet
  line(random(500), random(500), random(500), random(500));

  stroke(#A73E5C); //buraczki z łyżką śmietany
  line(random(500), random(500), random(500), random(500));

  stroke(#FE9551); //pomarańcz
  line(random(500), random(500), random(500), random(500));

  stroke(#FFD285); //jasne toffi
  line(random(500), random(500), random(500), random(500));
}

void mousePressed() {
  background(#EC7263);
  redraw();
}

void keyPressed() {
  if (keyCode == UP) {
    saveFrame("##.png");
  }
}

