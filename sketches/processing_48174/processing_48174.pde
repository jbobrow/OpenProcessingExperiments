
void setup(){
  size(400, 400);
  smooth();
}
  void draw() {
  background(1);
stroke(0);
  drawEllipse (mouseX, mouseY, 150, 10);
  drawEllipse (0, 0, 200, 60);
  drawEllipse (0, height, 200, 60);
  drawEllipse (width, 0, 90, 60);
  drawEllipse (width, height, 90, 60);
}
 
void drawEllipse (float x, float y, float s, float st) {
  strokeWeight (3);
  fill(187,110,116);
  ellipse(x, y, s, s);
}
  
 void drawCross (float x, float y, float a){
   line(x,y,x+a,y+a);
   line(x,y+a,x+a,y);
   }


