
void setup() {
  size(400, 600);
  stroke(0, 20, 100, 225);
  for (int line_x=0; line_x<width; line_x+=50) {
    line(line_x, 0, line_x, height);
  }
}

void draw() {
  noStroke();
  for (int counter=1; counter < 150; counter ++) {
    fill( random(0), random(220), random(225), random(255) );
    ellipse(random(width), random(height), 75, 75);
    ellipse(random(width), random(height), 75, 75);
    ellipse(random(width), random(height), 75, 75);
    ellipse(random(width), random(height), 75, 75);
  }
}



//ellipse(random(width), random(height), 40, 40); ellipse(random(width), random(height), 75, 75); ellipse(random(width), random(height), 60, 60);
//ellipse(random(width), random(height), 25, 25); ellipse(random(width), random(height), 70, 70);

