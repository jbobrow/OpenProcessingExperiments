
/*
 * Moritz Schmidt
 * 06.11.2014
 * K12_Interaktion_mit_Objekten
 */
 
 int anzahlObjekte = 10;
 Kreis[] kreis = new Kreis[anzahlObjekte];
 
 void setup() {
   size(800, 600);
   background(0);
   stroke(255, 0, 0);
   fill(0);
   smooth();
   
   for(int i = 0; i < anzahlObjekte; i++) {
    kreis[i] = new Kreis(); 
   }
}
 
 void draw() {
   background(0);
   for(int i = 0; i < anzahlObjekte; i++) {
    kreis[i].show(); 
   }
   
}
 
 class Kreis {
  
   int xPos, yPos;
   
  Kreis() {
    this.xPos = (int)random(800);
    this.yPos = (int)random(600);
  }
  
  void show() {
    if(dist(this.xPos, this.yPos, mouseX, mouseY) <= 25)
      strokeWeight(5);
  else
    strokeWeight(1);
    
   ellipse(this.xPos, this.yPos, 50, 50); 
  }
 }
