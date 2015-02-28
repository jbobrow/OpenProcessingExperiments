
 
void setup() {  
  size(500, 500);
  background(250);  

}
 
void draw() {
  for (int y = 0; y <= 500; y += 5) {
    for (int x = 0; x <= 500; x += 5) {
      if ((x % 10) == 5) {
        line(x, y, x+0, y-5);
        line(x, y, x+0, y+5);
      }
    }
  }
}
 
                
   
    

