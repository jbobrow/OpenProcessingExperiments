

void setup(){
  size(1000,1000);
}

void draw(){
background(255);
drawStickFigure(mouseX,mouseY);
}
void drawStickFigure ( int x, int y){
  ellipse(x,y,100,100);
line(x,y+50,x,y+250);
line(x,y+ 70,x+50,y+150);
line(x,y+ 70,x- 50,y+ 150);
line(x,y+ 250,x- 50,y+ 350);
line(x,y+ 250,x+ 50, y+ 350);
}
