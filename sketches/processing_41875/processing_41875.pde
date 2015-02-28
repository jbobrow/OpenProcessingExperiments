
void setup(){
  size(400,400);
  background(200);
  
}


void draw(){
  background(200);
  drawCross(0,0,40,5,5);
  drawCross(0,360,40,5,5);
  drawCross(360,0,40,5,5);
  drawCross(360,360,40,5,5);
  drawCross(mouseX-20,mouseY-20,40,255,5);
  
}


void drawCross(float x, float y, float crossSize, int c, float w) {
  stroke(c);
  strokeWeight(w);
  line(x, y, x+crossSize, y+crossSize);
  line(x+crossSize, y, x, y+crossSize);
}                               
