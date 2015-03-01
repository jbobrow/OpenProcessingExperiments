
void setup(){
  size (500,500);
}
void draw(){
  background(255);
  fill(mouseX,mouseY,0);
  drawBeanPole(mouseX,mouseY);
}

void drawBeanPole(int x,int y) {
  int b = 100;
  stroke(0);
  ellipse(x,y,b,b);
  line(x,y+50,x,y+200);
  line(x-75,y+75,x+75,y+75);
  line(x-75,y+275,x,y+200);
  line(x+75,y+275,x,y+200);
}
