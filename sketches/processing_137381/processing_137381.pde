
float a, x, y, px, py = 0;
float sfill = 1;
void setup() {
  size(600, 600);
}

void draw() {
  noStroke();
  fill(0, 2);
  rect(0, 0, width, height);
  ///
  a += 0.1;
  if (x > width) {
    x = 0; 
    px = 0;
  }
  x++;
  y = sin(a) * map(mouseY, height, 0, 0, 200);
  strokeWeight(sfill);

  stroke(map(mouseX, 0, width, 100, 255));
  line(px, width/2 + py, x, width/2 + y);

  px = x;
  py = y;
}
void keyPressed() {
  if ((key =='x')||(key=='X')) {
    sfill++;
  }
  else if ((key == 'z')||(key == 'Z')) {
    if (sfill - 1 > 0) {
      sfill--;
    }
  }
}

