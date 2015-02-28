
void setup (){
  size (600, 300);
  background (255);
  smooth();
}



void draw() {
   float anzahl = random (40);
   for (int i=0; i < anzahl; i = i + 1) {
   float posX = random (width);
   float posY = random (height);
   fill(0);
   line (300, 150, posX, posY);
   smooth();
   
   }
}

  void mousePressed() {
 
  stroke (255, 255, 255, 125);
 
}

void mouseReleased() {
  
   stroke (0, 0, 0, 125);
   
}
 


      


  






