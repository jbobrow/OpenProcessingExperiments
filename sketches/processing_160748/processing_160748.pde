
void setup() {
  size(600,600);
}

void draw(){
  background(255);
  drawStickFigure(mouseX,mouseY);
}

void drawStickFigure(int x, int y ){
  fill(#F2EAAB);
  stroke(0);
  ellipse(x,y,30,30);
  line(x-50,y-50,x,y+50);
  line(x+50,y-50,x, y+50);
  line(x-50,y+150,x,y+100);
  line(x+50,y+150,x,y+100);
  line(x,y+15,x,y+100);
}
