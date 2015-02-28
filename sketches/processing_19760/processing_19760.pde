
PFont font; 
float x1 = 0;
void setup(){ 
  size(250, 250); 
  font = loadFont("Arial-Black-65.vlw"); 
}
void draw(){ 
  background(#010627); 
  
  textFont(font, 200);
  fill(#7FFF24, 60);
  text("N", -30, 100);
  text("5", 50, 200);
  text("Y", 140, 260);
  
  fill(#1693A5, 60);
  text("1", -30, 260);
  text("R", 50, 200);
  text("5", 140, 100);
  
  textFont(font, random(150));
  fill(#1693A5);
  text("N", x1, 70); 
  text("R", x1, 230);
  text("Y", x1, 140);
  
  fill(#7FFF24);
  text("1", 100, 140);
  text("5", 50, 70);
  text("5", 150, 230);
x1 += 1.0;
if (x1 > width) {
x1 = -100;
}
}



