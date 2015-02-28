
void setup() {
  size(600, 600);
  noStroke();
  smooth();
  noCursor();
}
 
 
void draw() {
 
  int g = 60;
  int diametro = 0;
  while(g < 150){
    ellipse(mouseX, mouseY, diametro, diametro);
    fill(mouseX, g, 120, mouseY)
    g += 10;
    diametro += 6;
 
     
  }
}
