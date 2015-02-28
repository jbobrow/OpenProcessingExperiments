
void setup() {  //setup function called initially, only once
  size(300, 300);
  smooth();
  noStroke();
  colorMode(HSB,360,100,100);

}

void draw() {  //draw function loops 
  float x= mouseX;
  float y= mouseY;
  float ix=width-mouseX;
  float iy=height-mouseY;
  background(0);
  fill(55,100,100,220);
  ellipse(x, height/2, y, y);
  fill(8,100,100,150);
  ellipse(ix, height/2,iy,iy);
}
