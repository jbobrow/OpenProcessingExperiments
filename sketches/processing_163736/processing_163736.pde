
void setup (){
  size (300, 300);
  smooth ();
  noLoop ();
  background (255);
  
}
  
void draw (){
  for (int i = 0; i < 1000; i ++){
  drawBubble (int (random (255)),int (random (255)), int (random (255)), 
  40, int (random (0, 300)), int (random (0, 300)), 50, 50);
  
}
}

void drawBubble(int R, int G, int B, int brightness, int x, int y, int size1, int size2) {
  noStroke ();
  fill (R, G, B, brightness);
  ellipse (x, y, size1, size2);
  
}




