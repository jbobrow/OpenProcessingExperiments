
float r = 10;
void setup() {
  smooth();
  size(300,1100);
  noStroke();


void draw() {  
  background(255);
  
  for (int i = 0; i <= 100; i++){

    for (int a = 0; a <= 50; a++){
      float d = dist(mouseX, mouseY, a*20, i*20); 
      fill(a*20, mouseX, mouseY);

      if (d < r + 50) {
        r = 0;
      }
      
      else {
        r = 10;
      }
      
      ellipse(a*20, i*20,  r, r);

    }
    
  }

}
