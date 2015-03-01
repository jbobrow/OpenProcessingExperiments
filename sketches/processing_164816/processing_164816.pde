
float posX;float posY;
 
void setup(){
size(400,400);
background(70);
setGradient(0, 0, width, height, color(94, 184, 182), color(118, 161, 96), 1);

}
 
void draw(){
if(mousePressed){
  stroke(random(142),random(96),random(150),50);
  smooth();
line(posX,posY,mouseX,mouseY);
}
}
 
void mousePressed(){
posX = mouseX;
posY= mouseY;
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == 1) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == 2) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
