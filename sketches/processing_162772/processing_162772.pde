
void setup (){
  size (500,500);
}
void draw(){
  fill(75,75,0);
  rect (25,25,300,500);
  
  int x = 50;
  int y = 50;
  
  while (y < height) {
    drawWindow(x,y);
    drawWindow(x+100,y);
    drawWindow(x+200,y);
  y = y + 75;
  }
  
}




void drawWindow (int x, int y) {
 
  fill(100,100,0);
  stroke(0);
  rect (x,y,50,50);
  line (x+0,y+50/2,x+50,y+50/2);
  line (x+50/2,y+0,x+50/2,y+50);
 
  }
  

