
int circleX = 0;
int circleSize = 0;

void setup () {
  size (500, 500);
  smooth ();
}

void draw () {
  background (255, 220, 220);
  ellipse (circleX, 100, circleSize, circleSize);
  
  circleX = circleX + 1;
  circleSize = circleSize + 1;
  

  
}
                
                                                
