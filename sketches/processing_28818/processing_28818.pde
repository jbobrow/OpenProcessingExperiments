

void setup() {
  size (400,400);
  smooth();
    colorMode(HSB, 150);
}


void draw() {
  
  background(22,22,22); 
  int x = 0;
  int y = 0;
  float angle = 1;
  
  for (x = 0; x <= height; x+=24) {
    
    for (y = 0; y <= width; y+=1) {
     
      pushMatrix(); 
      line(x, y, x, y);

      translate(x,y);
      angle = atan2(y-mouseY, x-mouseX);   
      float abstand = dist(mouseX, mouseY, x, y); 
      rotate(angle); 
      line(10,10,abstand/10,10);
      popMatrix();
    
    }
    if(mousePressed) {
  
  float abstand = dist(pmouseX, pmouseY, x, y);
ellipse(mouseX,mouseY,10,10);
}
  
   }

}

