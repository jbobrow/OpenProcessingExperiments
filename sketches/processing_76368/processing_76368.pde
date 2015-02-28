
//David Kim
//Creative Programming
//Assignment 3-2
//10-15-12

void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  noStroke();
  smooth();
  
  int opacityLine = 50;
  int opacityCircle = 200;
  
  //ELLIPSES
  for (int i=0; i<10; i++) {
    fill(0+(i*25), 50, 250-(i*25), opacityCircle);
    ellipse(width/2, height/2, 550-(i*25), 550-(i*25));
  }
  
  for (int i=0; i<15; i++) {
    fill (225-(i*20), 0+(i*20), 50, opacityCircle);
    ellipse(width/2, height/2, 300-(i*25), 300-(i*25));
  }

  //LINES
  for (int i=0; i<width; i++) { //sample color of line
    color c = get(i, mouseY);
    stroke(c, opacityLine);
    line (i, 0, i, height);

    color b = get(mouseX, i);
    stroke(b, opacityLine);
    line (0, i, width, i);
  }
}
