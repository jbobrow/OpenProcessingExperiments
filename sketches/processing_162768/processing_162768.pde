
void setup(){ 
  size(800,800);
  background(255);
}  

void draw(){
  drawWindow(100,100);
  drawWindow(250,100);
  drawWindow(100,250);
  drawWindow(250,250);
  drawWindow(100,400);
  drawWindow(250,400);
  noFill();
  rect(50,50,350,500);
  line(0,550,800,550);

}

void drawWindow(int x, int y){
  noFill();
  rect(x,y,100,100);
  line(x+0,y+100/2,x+100,y+100/2);
  line(x+100/2,y+0,x+100/2,y+100);
}
