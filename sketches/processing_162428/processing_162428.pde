
void setup(){
  size(600,600);
  background(100,100,100);
}

void draw(){
  drawMonster(mouseX, mouseY);
}

void drawMonster(int x, int y){
  fill(100,100,100);
  ellipse(x,y,200,400);
  ellipse(x,y,200,200);
  ellipse(x,y,50,50);
  ellipse(x-150,y+100,100,50);
  ellipse(x+150,y+100,100,50);
  ellipse(x,y+125,100,20);
  ellipse(x+100,y+200,50,100);
  ellipse(x-100,y+200,50,100);
  if (mousePressed){
    background(100,100,100);
  }
}
