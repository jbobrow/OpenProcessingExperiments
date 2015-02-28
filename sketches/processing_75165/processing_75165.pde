
void setup() {
  size(500, 500);
  background(156, 250, 249);
}
void draw(){
   background(156, 250, 249);
  noStroke();

  fill(255);
  rect(height/2 - 25, width/2 -25, 50, 50);
  if(mousePressed){
      background(156, 250, 249);
    
  for(int y = 0; y <= width; y = y + 30){
    for(int x = 0; x <= width; x = x + 30){
      fill(255);
      rect(x, y, 10, 10);
}
  }
  }
}
