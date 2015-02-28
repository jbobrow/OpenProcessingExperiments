
PFont font; 
float x1 = -20;

void setup(){ 
  size(250, 250); 
  font = loadFont("OratorStd-20.vlw");
  textFont(font); 
  smooth();
  fill(62, 59, 47);
}
void draw(){ 
  background(245, 193, 5); 
  text("M3J 3S9", x1, 10);
  text("M3J 3S9", x1, 30);
  text("M3J 3S9", x1, 50); 
  text("M3J 3S9", x1, 70);
  text("M3J 3S9", x1, 90);
  text("M3J 3S9", x1, 110);
  text("M3J 3S9", x1, 130);
  text("M3J 3S9", x1, 150);
  text("M3J 3S9", x1, 170);
  text("M3J 3S9", x1, 190);
  text("M3J 3S9", x1, 210);
  text("M3J 3S9", x1, 230);
  text("M3J 3S9", x1, 250);
  text("M3J 3S9 M3J 3S9 M3J 3S9 M3J 3S9 M3J 3S9", 10, 80);
  frameRate(100);
  x1 += 1.0;
  if (x1 > width) {
      x1 = -150;
  }
}

