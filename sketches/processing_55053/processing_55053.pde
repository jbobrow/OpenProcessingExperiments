
void setup(){
size(400,400);
}
void draw(){
background(100);
drawMickey(mouseX,mouseY);
smooth();
}

void drawMickey(float x, float y) {
 fill(0);
  ellipse(x,y,30,30);
  ellipse(x+10,y-10,20,20);
  ellipse(x-10, y-10, 20,20);
}


