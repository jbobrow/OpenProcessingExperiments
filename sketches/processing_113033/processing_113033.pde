
void setup() {
  size(500, 500);
  frameRate(12);
  //noLoop();
}
 
void draw() {
  background(255, 247, 247);
   
  for (int x = 0; x <= width; x += 100) {
    for (int y = 0; y <= height; y+=100) {
     
 
  fill(209, 128, 53);
  ellipse(x, y, 25, 25);
  noFill();
   
  fill(255);
  ellipse(x, y, 25, 15);
  noFill();
   
  fill(190, 217, 227);
  ellipse(x, y, 15, 15);
  noFill();
   
  fill(0);
  ellipse (x, y, 5, 5);
   
  
  }
}


}
