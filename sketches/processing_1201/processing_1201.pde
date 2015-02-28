
int gridSz = 7;
  int tabs = gridSz^2;
int arrayNum;
float x,y;

Grid[]grids = new Grid[tabs];

void setup(){
 size((450),(450),P2D); 
 frameRate(10);
 background(255);  
 colorMode(HSB);
  
  for(int i = 0; i < tabs; i++){
    arrayNum = i;
    for(int n = 0; n < gridSz-1; n++){
      x = ((gridSz*(n*10)));
      for(int r = 0; r < gridSz-1; r++){
        y = ((gridSz*(r*10)));
        grids[arrayNum] = new Grid(arrayNum,gridSz,x,y); 
      }
    }
  }

}

void draw(){
  
   for(int i = 0; i < tabs; i++){
    arrayNum = i;
    for(int n = 0; n < gridSz-1; n++){
      x = ((gridSz*(n*10)));
      for(int r = 0; r < gridSz-1; r++){
        y = ((gridSz*(r*10)));
        grids[arrayNum].updateGrid(arrayNum,gridSz,x,y); 
      }
    }
  }
  
  
}

