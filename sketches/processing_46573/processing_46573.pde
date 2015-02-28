
void setup() {

 size(700, 700);
 smooth();
 background(#F2841D);

}


void drawTree(float x, float y, float big, int levels) {

 pushMatrix();
 {
   translate(x, y);
   line(0, -big/4, -big/4, -big); // brazo izquierdo
   line(0, -big/4, 0, -big);         // brazo central
   line(0, -big/4, big/4, -big);  // brazo derecho
   line(0, 0, 0, -big/4);         // tronco

   if (levels > 0) {
     stroke(0, random(48, 98), 0);                            //color hojas
     drawTree(-big/2, -big, big*(random(.5, 1)), levels - 1); // Y izquierda
     drawTree(big/2, -big, big*(random(.5, 1)), levels - 1);  // Y derecha
     stroke(93, random(50, 93), 0);                           // color ramas
     drawTree(0, -big*(random(.5, 1)), big*0.8, levels - 1 );     // rama central
   }
 }
 popMatrix();

} void drawTronco(float x, float y, float x1, float y2) {

 strokeWeight(11);
 {
   stroke(#624407);
   line(x, y, x1, y2);
 }

}

void draw() { }

void mouseReleased() {

 drawTree(mouseX, mouseY, 100, round(9));            
 drawTronco(mouseX, mouseY, mouseX, mouseY-90);      

}    
