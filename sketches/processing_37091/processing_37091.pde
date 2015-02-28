
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
    fill (6,8,12);
  }
  
  if(x>500){
    directionx = -1;
    fill (240,26,58);
  }
  if(y<0){
    directiony = 2;
    fill (68,72,120);
  }
  if(y<0){
    directiony = 1;
    fill (45,140,250);
  }
  if(x<0){
    directionx = 2;
    fill (5,250,12);
  }
}

