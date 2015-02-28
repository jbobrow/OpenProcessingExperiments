
int azul;
void setup(){
  size(600, 600);
  colorMode(HSB);
  azul=6;
}
void draw() {
  background(random(80, 150), 250);
  fill(azul/2, 180, 200);
  ellipse(random(100, width), random(height),50,50);
  
ellipse(width-azul, height/4, azul, azul);
}
  
