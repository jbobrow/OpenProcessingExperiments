
int direction;
int x;
int y;
int directionx;
int directiony;

int x2;
int y2;
int directionx2;
int directiony2;

int x3;
int y3;
int directionx3;
int directiony3;


void setup(){
  size (600,600);
  smooth();
  background(0);
  fill(50,20,120);
  rect(0,0,600,600);

  
  direction=1;
  x=100;
  y=100;
  directionx=1;
  directiony=1;
  x2=100;
  y2=100;
  directionx2=1;
  directiony2=1;
  x3=100;
  y3=100;
  directionx3=1;
  directiony3=1;
 
}

void draw(){
  
  
  x+=directionx; //x = x + directionx;
  y+=directiony;
  if(y > 600){
    directiony= -4;
  }
   if(x > 600){
    directionx= -4;
   
  }
      if(y < 0){
    directiony= +10;
      }
  
    if(x < 0){
    directionx= +3;
    }
  
  
  ellipse(x,y,20,20);


  x2+=directionx2; //x = x + directionx;
  y2+=directiony2;
  if(y2 > 600){
    directiony2= -4;
  }
   if(x2 > 600){
    directionx2= -4;
   
  }
      if(y2 < 0){
    directiony2= +3;
      }
  
    if(x2 < 0){
    directionx2= +20;
    }
  
  
  ellipse(x2,y2,20,20);
  
  
  x3+=directionx3; //x = x + directionx;
  y3+=directiony3;
  if(y3 > 600){
    directiony3= -4;
  }
   if(x3 > 600){
    directionx3= -4;
   
  }
      if(y3 < 0){
    directiony3= +3;
      }
  
    if(x3 < 0){
    directionx3= +50;
    }
  
  
  ellipse(x3,y3,20,20);
  
}


