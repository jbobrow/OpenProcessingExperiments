
int directionx ;
int directiony ;
int x;
int y;
int sizex;
int sizey;


void setup (){
  size (500,500);
  directionx = 1;
  directiony = 1;
  x = 50;
  y = 70;
  sizex = 50;
  sizey = 50;
}

void draw (){
  x+= directionx;
  y+= directiony;
  ellipse(x,y,sizex,sizey);
  
  if(y>500){
    directiony = -1;
    sizex = 60; sizey = 50;
  }
  
  if(x>500){
    directionx = -1;
    sizex = 40; sizey = 30;
  }
  if(y<0){
    directiony = 2;
    sizex = 60; sizey = 50;
  }
  if(y<0){
    directiony = 1;
     sizex = 60; sizey = 50;
  }
  if(x<0){
    directionx = 2;
     sizex = 200; sizey = 180;
  }
}

