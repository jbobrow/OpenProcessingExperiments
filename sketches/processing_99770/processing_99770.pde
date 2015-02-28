
void setup() {
  size(500,500);
  smooth();
}
  
void draw() {
smooth();
  float x = mouseX;
  float ix = width-mouseX;
  float ixx = width-mouseX/1.5;

  float y = mouseY;
  float iy = height-mouseY/1.3;
  float iyy = height-mouseY/1.5;
  
  background(2, 62, 115);
    
  noStroke();
  
  fill(4, 191, 173);
  
  fill(3,140,127);
  
  arc(iy, ix, ix, ix, 0, PI+QUARTER_PI);

  
  fill(4, 191, 173);

  arc(y, x, x, x, 0, PI+QUARTER_PI);


  fill(242,154,46);
  arc(iyy, ixx, ixx, ixx-50, 0, PI+QUARTER_PI);
  
}



