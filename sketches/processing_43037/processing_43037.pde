
void setup() {
  size(450, 450);
  smooth(); //grosor línea
  background(100,0,0,120);
}

void drawTree(float x, float y, float big, int levels) {

  
  {
    translate(x,y);   
    line(0, 0, 0, -big/2);    // tronco
    stroke(0, 30, 0); 
    line(0, -big/2, -big/2, -big); // brazo izquierdo
    stroke(0,100,50);
    line(0, -big/2, big/2, -big);  // brazo derecho
    stroke(0,120,80);
    
if (levels > 1) {
      drawTree(-big/2, -big, big*0.8, levels - 1); // Y izquierda
      stroke(0, 30, 0);
      smooth();
      drawTree(big/2, -big, big*0.2, levels - 1);  // Y derecha
      stroke(0, 130, 50);
      smooth();
    }  
}
  
}

void draw() {   // mantener función para que se dibuje                    
}

void mouseReleased() {
  drawTree(mouseX, mouseY, random(10, 80), round(random(3, 6)));
}
