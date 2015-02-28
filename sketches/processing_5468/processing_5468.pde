
Cell[][] square;

int rows = 10;
int cols = 10;
// the number of square in rows, cols

void setup(){
  square = new Cell[20][20];
  size(200,200);
  background(255);
  for(int i=0; i<rows; i++){
    for(int j=0; j<cols; j++){
      square[i][j] = new Cell(i*width/rows, j*height/cols);
      square[i][j].coloring();
    } 
  }
}

void draw(){
  int x,y;
  x = int(mouseX*rows/width);
  y = int(mouseY*cols/height);
  
  square[x][y].coloring();
  
  if(x!=0){
    square[x-1][y].coloring();
    if(y!=0){    
      square[x-1][y-1].coloring();
    }
    if(y!=cols-1){
      square[x-1][y+1].coloring();
    }    
  }
  
  if(x!=rows-1){
    square[x+1][y].coloring();
    if(y!=0){    
      square[x+1][y-1].coloring();
    }
    if(y!=cols-1){
      square[x+1][y+1].coloring();
    }    
  }
  
  if(y!=0){
    square[x][y-1].coloring();
  }
  if(y!=cols-1){
    square[x][y+1].coloring();
  }  
}


class Cell{
  float x,y;
  Cell(float xx, float yy){
    x = xx;
    y = yy;
  }
  void coloring(){
    stroke(255);
    fill(random(0,255),random(0,255),random(0,255));
    rect(x,y,width/rows,height/cols);
  }
} 

  

