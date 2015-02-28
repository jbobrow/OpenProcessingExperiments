
void setup() {
  size(1200, 720);
  noStroke();
}
void draw() {   
  for (int i = 0; i < 100; i++) {
      float r = random(23);
      float x = random(1280);
     
      int xc = mouseX;
      int yc = mouseY;
      if (mousePressed) {
        fill(ranx, rany, ranz,120);
      } else {
        fill(ranx, ranx, ranx,120);
      }   
      if (mousePressed) {
           rect(x, y, r, r);     
      } else {
          rect(x, y, r, r);
    }
   }  
    
    
}


