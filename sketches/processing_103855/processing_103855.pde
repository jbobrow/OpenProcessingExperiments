
void setup() {
 size(500, 500);
 smooth();
 anillos = new Anillo[numAnillos];
 for (int i = 0; i < numAnillos; i++) {
  anillos[i] = new Anillo();
 } 
 
}

void draw() {
 background(0);
 for (int i = 0; i < numAnillos; i++) {
  anillos[i].crecer();
  anillos[i].mostrar();
 } 
}

void mousePressed() {
 anillos[anilloActual].inicio(mouseX, mouseY);
 anilloActual++;
if (anilloActual >= numAnillos) {
 anilloActual = 0;
} 

  
}



class Anillo {
 float x, y;
 float diametro;
 boolean on = false;
 
 void inicio(float xpos, float ypos) {
  x = xpos;
  y = ypos;
  on = true;
  diametro = 1;
 } 
  
  void crecer() {
   if ( on == true) {
    diametro += 0.5;
    if (diametro > 1000) {
     on = false; 
    }
   } 
  }
  
  void mostrar() {
   if (on == true) {
    noFill();
    strokeWeight(4);
    stroke(155, 153);
    ellipse(x, y, diametro, diametro);
    
   } 
  }
  
  
}
