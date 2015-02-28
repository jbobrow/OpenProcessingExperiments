
void setup() {
  size(400, 600);
}

void draw() {
  stroke(random(0), random(40), random(80), random(205) );
  for (int line_x=0; line_x<width; line_x+=50) {
//    line(line_x, 0, line_x, height);
    line(line_x, 0, mouseX, mouseY);
  }

  noStroke();
  /*for (int counter=1; counter < 150; counter ++) {
    fill( random(0), random(220), random(225), random(255) );
    ellipse(random(width), random(height), 75, 75);
    ellipse(random(width), random(height), 75, 75);
    ellipse(random(width), random(height), 75, 75);
    ellipse(random(width), random(height), 75, 75);
  }*/
}
