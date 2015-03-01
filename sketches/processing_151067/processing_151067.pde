
Line l;
boolean drawOK=false;
void setup(){
  size(640,480);
  colorMode(RGB);
  background(0);
  l =new Line();
}
void draw(){
  if(drawOK){
  l.drawLine(mouseX,mouseY);
  }
}
void mousePressed(){
  drawOK=true;
}
void mouseReleased(){
  drawOK=false;
}

class Line{
  void drawLine(float x,float y){
    noFill();
    stroke(random(255),random(255),random(255));
    line(x,y,random(640),random(480));
  }
}




