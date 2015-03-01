
int x = 200;
int y = 200;

void setup(){
  size(500,500);
  while(y<height){
    drawWindow(x,y);
    drawWindow(x+75,y);
    y=y+10;
  }

void draw(){
  drawBuilding();
 drawWindow();
}
    void drawWindow(){
      rectMode(CENTER);
      rect(x,y,150,150);
      line(x,y-75,x, y+75);
      line(x-75,y,x+75,y);
      
      }

void drawBuilding(){
rect(x,y,450,450);
}


  
  
      
      
      
