
void setup (){
  size (300, 300);
  smooth ();
  noLoop ();
  background (0);
  
}
  
void draw (){
  for (int i = 0; i < 1000; i ++){
 drawBubble(int (random (150)),int (random (0, 300)), int (random (0, 300)), 50, 20);
  
}
}

void drawBubble(int bright, int x, int y, int size1, int size2) {
  strokeWeight (10);
  noStroke ();
  fill (193, 216, 245, bright);
  ellipse (x, y, size1, size2);
  
}




