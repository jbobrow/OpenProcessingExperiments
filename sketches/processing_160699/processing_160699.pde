
void setup(){
  size(500,500);
}
void draw(){
  background(255);
  drawStickFigure(mouseX,mouseY);
}
void drawStickFigure(int x, int y){
  ellipse(x,y,75,75);
  {
    fill(0);
  }
  line(x,y+200,x,y);
  line(x+100,y+40,x-100,y+75);
  line(x+105,y+300,x,y+200);
  line(x-105,y+300,x,y+200);
}
