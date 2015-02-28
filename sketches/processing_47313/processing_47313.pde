
void setup() {
  size(700, 500);
  smooth();
  background(#992580);

}


void drawTree(float x, float y, float big, int levels) {
 
strokeWeight(3);

 pushMatrix();
  {
    translate(x, y);

    line(0, 0, 0, -big/2);         // tronco
    line(0, -big/2, -big/2, -big); // brazo izquierdo
    line(0, -big/2, big/2, -big);  // brazo derecho

    // recursividad
    if (levels >1) {
      drawTree(-big/2, -big, big*.8, levels - 2); // Y izquierda
      drawTree(big/2, -big, big*0.8, levels - 1);  // Y derecha
    }
  }
  popMatrix();
}


void draw() {
}

void mouseReleased() {
  drawTree(mouseX, mouseY, random(80, 100), round(random(8, 10)));
}
            
                
