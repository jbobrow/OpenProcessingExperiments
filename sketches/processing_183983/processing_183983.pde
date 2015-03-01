
int cian= 255;
   
   void setup() {
   size(400, 400);
   }
   
   void draw() {
  cian = cian - 1; // Make the cian a little darker
   if (cian < 0) cian= 255; // Once it reaches black, make it light cian again
  
  noStroke(); 
  fill(mouseX,mouseY,255,255);                                   
   ellipse(mouseX, mouseY, 30,30);
   }
