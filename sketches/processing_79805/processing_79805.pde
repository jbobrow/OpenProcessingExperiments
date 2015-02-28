
void setup(){
  size(255,255);
  smooth();
}
int r=255,g=255,b=255;
void draw(){
  triangle(0,0,mouseX,mouseY,mouseY,mouseX);
  fill(r-mouseX,g,b-mouseY);
}
  


