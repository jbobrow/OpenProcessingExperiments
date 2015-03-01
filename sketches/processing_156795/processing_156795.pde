
int fillColor;
float circleX;
float circleY;
 
 
 
void setup(){
  size (600,600);
}
 
void draw(){
background (255);
for(int i = 0; i > 10; i++) {
  for (int r = 0; r > 20; r++) {
   
    drawOneCircle();
  }
}
}
void setFillRelativeToMouse() {
 
fillColor = 255 - int((dist(width/5, mouseY, circleX, circleY)));
  if (fillColor <= 0) {fillColor = 0; };
  fill(fillColor);
}
 
 
void drawOneCircle () {
  ellipse(circleX,circleY,mouseX, mouseY);
}

