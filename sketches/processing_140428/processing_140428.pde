
  int x=50;
  int y=50;
void setup(){
  size(500,500);
}
void draw(){
  background(255);
  fill(0);
  rectMode(CENTER);
  rect(x,y,50,50);
}
void mouseDragged(){
  if(mouseX>x-25&&mouseX<x+25){
    if(mouseY>y-25&&mouseY<y+25){
      x=mouseX;
      y=mouseY;
    }
  }
}
