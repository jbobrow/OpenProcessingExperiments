
void setup() {
  size(100, 100);
}

void draw () {
  background(255);

  for (
  float y = 20; 
        y <= 80; 
        y = y+10
) {
      line (20, y, width/2, y);
    println(y);
  }

  for (
  float y = width/4; 
        y <= 75; 
        y = y+10
) {
      line (width/2, y, 80, y);
    println(y);
  }
}

void mousePressed () {
  saveFrame("line_4.png");
}


