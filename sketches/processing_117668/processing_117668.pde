
void setup(){
  size(300,300);
}
 
void draw() {
}
 
void dibujarCirculoRojo(int posicionX, int posicionY){
    fill(255,0,0);
    ellipse(posicionX, posicionY, 30, 30);
}
 
void dibujarCirculoAzul(int posicionX, int posicionY){
    fill(0,0,255);
    ellipse(posicionX, posicionY, 30, 30);
}

void mousePressed(){
  dibujarCirculoRojo(mouseX, mouseY);
}
