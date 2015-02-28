
int directionx ;
int directiony ;
int x;
int y;

void setup (){
  size (500,500);
  directionx = 1;
  directiony = 1;
  x = 50;
  y = 70;
}

void draw (){
  x+= directionx;
  y+= directiony;
  ellipse(x,y,50,50);
  
  if(y>500){
    directiony = -1;
  }
  
  if(x>500){
    directionx = -1;
  }
  if(y<0){
    directiony = 2;
  }
  if(y<0){
    directiony = 1;
  }
  if(x<0){
    directionx = 2;
  }
}

