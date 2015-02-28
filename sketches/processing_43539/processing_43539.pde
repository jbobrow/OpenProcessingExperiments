
PFont font; 
float angle = 0.5;
void setup() {
  size(620, 620);
  background (240, 187, 12);
  smooth();
}
void draw() {

  translate(mouseX, mouseY);
  rotate(angle);

  angle += 1.5;
  font = loadFont("Futura-Medium-25.vlw"); 
  textFont(font); 
  fill(1);
  text("ACOUPHENES-PARADE          UN TAPUSCRIPT CHERCHE SON EDITEUR", mouseX, mouseY); // Write at coordinate
}


