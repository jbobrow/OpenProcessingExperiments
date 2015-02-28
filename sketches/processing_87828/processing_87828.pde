
void setup() {
  size(500, 500);
  smooth();
  background(255);
}

void draw() {                               
 
  fill(0);                                   
  for (int i = 0; i <= width; i += 10) {
    for (int j = 0; j <= height; j += 10) {
      rect(i++,j+.5,15,10);
    }
  }
  fill(255);                                   
  for (int i = 0; i <= width; i += 10) {
    for (int j = 0; j <= height; j += 10) {
      rect(i++,j+1,50,5);
}
  }
}
  
  
 


