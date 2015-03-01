
void setup () {
  size (600, 600);
  smooth();
}

void draw () {
  
  background (#57385c);
  fill (#ffedbc, 20);
  stroke(#57385c, 60);
  
  float angle = map(mouseX, 0, width, 0, PI/4);
  
  translate(width/2, height/2);
  foo2(400, angle);
}

void foo2(float rectSize, float angle) {
 while (rectSize > 5) {
 rotate(angle);
 rect(-rectSize/2, -rectSize/2, rectSize, rectSize);
 rectSize = rectSize - 5;
 }
}


