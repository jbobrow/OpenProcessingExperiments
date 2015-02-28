
void setup() {
  size(500, 500);
  smooth();
  background(255);
}

void draw() {                               
 
  fill(0);                                   //bg sparse dots
  for (int i = 30; i <= width-30; i += 20) {
    for (int j = 30; j <= height-30; j += 20) {
      for (int k = 30; k <= height; k += 70) {
      point(i+k/20,j+k);
    }
  }
}
}
  
  
  
 


