
//by echoechonoisenoise
//for brainCityLab 2010
float [][] cell;

void setup(){
  size(800,600,P2D);
  colorMode(RGB,1);
  cell=new float[width][height];

  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      cell[x][y]=random(1);
    }  
  }  
}

void draw(){

  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      set(x,y,color(cell[x][y]));
      if(neighbors(x,y)>4){
        cell[x][y]+=0.01;
      }
      if(neighbors(x,y)<4){
        cell[x][y]-=0.01;
      }
    }  
  } 
}


float neighbors(int x, int y){
  float value;
  if(x>0&&x<width-1&&y>0&&y<height-1){
    value=
      cell[x+1][y]+
      cell[x+1][y-1]+
      cell[x+1][y+1]+
      cell[x][y+1]+
      cell[x][y-1]+
      cell[x-1][y+1]+
      cell[x-1][y]+
      cell[x-1][y-1];
  }
  else{
    value=4;  

  }
  return value;
}

void mouseDragged(){
  for(int i=mouseX-30;i<mouseX+30;i++){
    for(int j=mouseY-30;j<mouseY+30;j++){
      if(dist(mouseX,mouseY,i,j)<30)cell[i][j]=random(1);
    }
  }
}


