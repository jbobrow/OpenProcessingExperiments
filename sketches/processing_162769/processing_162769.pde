
int x=0;
int y=0;
void setup(){
  size(500,500);
}
void draw(){
    if(mousePressed==true){
      drawBuilding(mouseX,mouseY);
    }

}
void drawWindow(int x,int y){
 rect(x,y,30,30);
 line(x+15,y,x+15,y+30);
 line(x,y+15,x+30,y+15);
}
void drawBuilding(int x, int y){
  rect(x,y,x+100,y+200);
  drawWindow(x+20,y+15);
  drawWindow(x+90,y+15);
  drawWindow(x+20,y+60);
  drawWindow(x+90,y+60);
  drawWindow(x+20,y+105);
  drawWindow(x+90,y+105);
  drawWindow(x+20,y+150);
  drawWindow(x+90,y+150);


}
