
//by echoechonoisenoise
//for brainCityLab2010

float[][][] cell;

void setup(){
  size(800,800,P2D);
  colorMode(HSB,8);
  cell=new float[width][height][2]; 
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      cell[x][y][1]=0;   
    }
  } 
}

void draw(){
  background(0,0,1.6);
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){ 
      cell[x][y][0]=cell[x][y][1];
      float nVal=neighbors(x,y);
      if (nVal>0){
        set(x,y,color(8-nVal,nVal,nVal)); 
      }
    }
  }
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){  
      float nVal=neighbors(x,y);

      if((nVal==8)&&cell[x][y][1]==1){
        cell[x][y][1]=0; 
      }
      if(nVal==3&&cell[x][y][1]==0){
        cell[x][y][1]=1; 
      } 
    }
  } 
}


float neighbors(int x, int y){
  float val;
  if(x>0&&x<width-1&&y>0&&y<height-1){
    val=cell[x+1][y][0]+
      cell[x-1][y][0]+
      cell[x+1][y+1][0]+
      cell[x+1][y-1][0]+
      cell[x][y-1][0]+
      cell[x][y+1][0]+
      cell[x-1][y+1][0]+
      cell[x-1][y-1][0];
  }
  else{
    val=4;
  } 
  return val;  
}


void mouseDragged(){
  for(int i=mouseX-3;i<mouseX+3;i++){
    for(int j=mouseY-3;j<mouseY+3;j++){
      if(mouseButton==LEFT)cell[i][j][1]=1;
      if(mouseButton==RIGHT)cell[i][j][1]=0;

    }
  }  
}




