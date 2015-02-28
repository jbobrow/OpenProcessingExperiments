
void setup() {
  size(500, 500);
  smooth();
  background(0);
}

void draw() {                                        //bg dots
  for (int i = 50; i <= width-50; i += 5) {
    for (int j = 50; j <= height-50; j += 20) {
      noStroke();
      fill(255,30);
      ellipse(i++, j++, 10, 10);
     
    }
  }
    
  fill(255);                                        //mg dots
  for (int i = 0; i <= width; i += 20) {
    for (int j = 0; j <= height; j += 20) {
      noStroke();
      ellipse(i, j, 10, 10);
 
 
   
    }
  } 
}     


