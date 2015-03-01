
Circle circle;
float r;
boolean drawOK=false;
void setup(){
  size(640,480);
  colorMode(RGB);
  background(0);
  circle =new Circle();
}
void draw(){
  if(drawOK){
  circle.drawCircle(mouseX,mouseY,r);
  r++;
  }
}
void mousePressed(){
  drawOK=true;
}
void mouseReleased(){
  drawOK=false;
  r=0;
}

class Circle{
  void drawCircle(float x,float y,float r){
    noFill();
    stroke(random(255),random(255),random(255));
    pushMatrix();
    translate(x,y);
    ellipse(0,0,r,r);
    popMatrix();
  }
}




