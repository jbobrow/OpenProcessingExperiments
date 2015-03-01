
//window
void setup() {
  size(500, 500);
  background(255);
}
void draw(){
  rect(100,50,325,500);
  int x = 150;
  int y = 100;
  
  while(y< height){
    drawWindow(x, y);
    drawWindow(x+85,y);
    drawWindow(x+175,y);
    y=y+150;
  }
}
  
  



void drawWindow(int x, int y){
  strokeWeight(3);
  rect(x, y, 50, 50);
  line(x+25, y, x+25, y+50);
  line(x, y+25, x+50, y+25); 
  line(x, y, x+25, y);
  line(x, y, x, y+25);
}
