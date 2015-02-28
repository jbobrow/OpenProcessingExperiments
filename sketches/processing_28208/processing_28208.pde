
void setup () {
  size (700,400);
  background (0);
  smooth(); 
}
 
void draw () {
  
  if (mousePressed) {
   
    for (int x = 0; x<width; x +=20) {
   
      for (int y = 0; y<height; y +=20) {
        fill (random(200),random(255),random(220));
        noStroke();
        rect (x, y, 40, 40);
        rect (x, y, 40, 40);
      }
    }
  }
}

