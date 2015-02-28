
void setup() {
  size(400, 400);

  strokeWeight(1);
}

void draw() {
  background(0);
  fill(255);

  //loop for(init; test; update)
  for (int y = 0; y <= mouseY; y = y + 60 ) {
    for (int x = 0; x <= mouseX; x= x+ 60) {
      stroke(150,0,0);
      line(x, y, mouseX, mouseY);
    }
  }
   for(int y = 50; y < mouseY; y = y + 70 ){
   for(int x = 50; x < mouseX; x= x+ 70){
   stroke(255, 0, 0);
   line(x, y, mouseX, mouseY);  
   }
   }
   for(int y = 100; y < mouseY; y = y + 40 ){
   for(int x = 100; x < mouseX; x= x+ 40){
   stroke(250);
   line(x, y, mouseX, mouseY);  
   }
   }
}
