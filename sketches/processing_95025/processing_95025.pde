
void setup() {
  background(0);
  size(500 , 500);
}
 
void draw(){
   
    for (int x = 0; x < 800; x += 110) {
    for (int y = 0; y < 600; y += 110) {
  
      int r = (int) (15 * (6.0 - dist(x, y, mouseX, mouseY) / 80));
        
      ciz (x, y, r);
    }
  }
 
  }
void ciz(int x, int y, int r) {
  rectMode(CENTER);
  rect(x, y, r*2, r*2);
}
