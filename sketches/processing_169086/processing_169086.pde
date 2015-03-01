
PFont font;
void setup() {
  size(600, 600);
  font = loadFont("AmericanTypewriter-48.vlw");
  textFont(font);
  fill(#FCFC08);
}


void draw() {
  if (mousePressed) {
    background(0);
    String s = "Failure";

    for (int i=0; i<100; i++) {
      float x = random(0, width);
      float y = random(0, height);
      float sz = random(10, 30);
      int substrbegin = (int)random(0, s.length()-1);
      int substrend = (int)random(substrbegin+1, s.length()-1);
      textSize(sz);
      text(s.substring
        (substrbegin, substrend), x, y);
     
      window();
    }
  }
}

void window() {
  stroke(216, 98, 7);
  strokeWeight(30);
  line(0, 0, width, 0);
  line(0, 0, 0, height);
  line(0, height, width, height);
  line(width, 0, width, height);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}

