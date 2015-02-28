
// Wictor Hugo - textura padrão
void setup() {
  size (300, 300);
}
  
void draw() {
  background(0);
  for (int x=25; x<300; x+=50) {
    for (int y=25; y<300; y+=50) { 
      fill(#9514C9);
      smooth();
      noStroke();            
      ellipse(x, y, 50, 50);
  }
 }
}
