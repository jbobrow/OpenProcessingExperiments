
//lines with starting point (0,0) x increasing by 1
//ending line starting at (500,500), x
int gridSize=20;

void setup(){
  size(640,640);
}

void draw(){
  background(0);
  for(int x=gridSize; x<width-gridSize; x+=50){
  for(int y = gridSize; y<=height-gridSize; y+=50){
    stroke(153,153,mouseX);
    line(x+25,mouseY,mouseX,y);
    }
  }
}


