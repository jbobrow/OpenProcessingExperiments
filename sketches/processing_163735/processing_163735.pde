
void setup (){
  size (700, 100);
  smooth ();
  noLoop ();
  background (100);
}

void draw (){
wave (50.0, 30.0, PI/12.0, 0.0, 10);
wave (60.0, 40.0, PI/18.0, 0.0, 20);
wave (70.0, 40.0, PI/24.0, 0.0, 30);
}

void wave (float offset, float scaleVal, float angleInc, float angle, int bright){
  
for (int x = 0; x <= width; x += 5) {
  noFill ();
  strokeWeight (50);
  stroke (198, 217, 240, bright);
  float y = offset + (sin(angle) * scaleVal);
  ellipse (x, y, 10, 10);
  y = offset + (cos(angle) * scaleVal);
  ellipse (x, y, 10, 10);
  angle += angleInc;
  
}
}





