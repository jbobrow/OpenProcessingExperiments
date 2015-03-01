
void setup(){
  size(600,600);
  background(0);
}

void draw(){
  fill(#A01212);
  rect(100,100,400,500);
  int x = 200;
  int y = 200;
  
  while(y < height){
    drawWindow(x,y);
    drawWindow(x+100,y);
    drawWindow(x+200,y);
    y += 100;
  }
}

void drawWindow(int x, int y){
  fill(#050505);
  stroke(#A01212);
  rect(x,y,30,30);
  rect(x-30,y-30,30,30);
  rect(x-30,y,30,30);
  rect(x,y-30,30,30);
}
  
