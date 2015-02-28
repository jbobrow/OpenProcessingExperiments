
void setup(){
  size(500,500);
  smooth();
  ellipseMode(CENTER);
}
void draw () {
  
  background (0);
  randomSeed(mouseX);
 
  float x;
  float y;
 
  for (int i=0; i < 40; i = i + 1) {
  for (int j=0; j < 40; j = j + 1) {
 
      
      x = i * 20;
      y = j * 20;
 
      
      fill (i *10, 0, j * 10);
      ellipse (x,  y,  random(20), random(20));
    }
  }
}
  
  

                
