

void setup() {
  size (400,400);
  smooth();
    colorMode(HSB, 100);
}


void draw() {
  
  background(22,44,244); // BG immer zuruecksetzen
  int x = 12;
  int y = 4;
  float angle = 4;
  
  for (x = 0; x <= width; x+=30) {
    
    for (y = 0; y <= height; y+=10) {
     
      pushMatrix(); 
      translate(x,y);
      angle = atan2(y-mouseX, x-mouseY);   
      float abstand = dist(mouseX, mouseY, x, y); 
      rotate(angle); 
      line(20,20,abstand/10,20);
      popMatrix();
    
    }
    if(mousePressed) {
  
  float abstand = dist(pmouseX, pmouseY, mouseX, mouseY);
  //ellipse(mouseX,mouseY,abstand,abstand);
  
  float dicke = 20-abstand;
  if(dicke <1) { dicke = 3; }
  strokeWeight(dicke);
  line(pmouseX, pmouseY, mouseX, mouseY);
  }
  
   }

}

