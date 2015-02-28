
void setup() {
  size (500, 500);
  smooth();
}
 
void draw() {
  background(250, 250, 250);
stroke(10);
  drawEllipse (mouseX, mouseY, mouseX, mouseY);
  drawEllipse (30, 30, 50, 50);
  drawEllipse (30, 480, 50, 50);
  drawEllipse (480, 30, 50, 50);
  drawEllipse (480, 480, 50, 50);
}
 
void drawEllipse (float x, float y, float s, float st) {
  strokeWeight (st);
  ellipse(x, y, s, s);
}
  
 void drawCross (float x, float y, float a){
   line(x,y,x+a,y+a);
   line(x,y+a,x+a,y);
   }
