
PFont font; 
float x1 = 0;

void setup(){ 
  size(250, 250); 
  font = loadFont("HelveticaNeue-UltraLight-72.vlw");
  textFont(font); 
  smooth();
  fill(253, 255, 167);
}
void draw(){ 
  background(0, 139, 165); 
  text("M3J 3S9", x1, 50); 
  text("M3J 3S9", x1, 100); 
  text("M3J 3S9", x1, 150); 
text("M3J 3S9", x1, 200);   
text("M3J 3S9", x1, 250); 

  frameRate(150);
  x1 += 1.0;
  if (x1 > width) {
      x1 = -150;
  }
}

