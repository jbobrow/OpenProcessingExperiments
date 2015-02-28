
void setup() {

 size(600, 500);
 smooth();
 background(253,247,204);
}

void drawTree(float x, float y, float big, int levels) {

 pushMatrix();
 {
   translate(x, y);
if(levels < 20);

   line(0, 0, 0, -big/2);  
strokeWeight(2);

// tronco
   line(0, -big/2, -big/2, -big);
  // brazo izquierdo

   line(0, -big/2, big/2, -big);  // brazo derecho
   ellipse (big/2, -big, 18,18 );
 
  fill(random(140,255),random(200,255),random(80,225));
   ellipse (-big/2, -big,20,20);
fill(random(140,255),random(200,255),random(80,220));


   // recursividad
   if (levels > 0) {
     
     drawTree(-big/2, -big, big*0.8, levels - 1); // Y izquierda
     drawTree(big/2, -big, big*0.8, levels - 1);  // Y derecha
  
 }
 }
 popMatrix();
}

void draw() { }

void mouseReleased() {

 drawTree(mouseX, mouseY, random(60, 100), round(random(1,12)));
} void mouseClicked() {

 redraw();
{

  saveFrame("arbolyoyi.jpg"); 
} }
                
