
void setup() {
  size (400, 400); 
  smooth();
}

void draw() {
  background(250, 100, 50);
stroke(0);
  drawEllipse (mouseX, mouseY, 150, 10);
  drawEllipse (0, 0, 290, 60);
  drawEllipse (0, height, 290, 60);
  drawEllipse (width, 0, 290, 60);
  drawEllipse (width, height, 290, 60);
}

void drawEllipse (float x, float y, float s, float st) {
  strokeWeight (st);
  ellipse(x, y, s, s);
}
 
 void drawCross (float x, float y, float a){
   line(x,y,x+a,y+a);
   line(x,y+a,x+a,y);
   }


