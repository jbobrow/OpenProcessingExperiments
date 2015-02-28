
int x;
int y;

int directionx;
int directiony;

//runs once
void setup(){
  size(600,800);
  smooth();
  x=0;
  y=100;
  directionx=5;
  directiony=5;
}

//runs every frame
void draw(){
  background(0);
  x+=directionx;
  y+=directiony;
  if(y>800){
    directiony=-5;
  }
  if(x>600){
    directionx=-5;
  }
  if(y<1){
    directiony=5;
  }
  if(x<1){
    directionx=5;
  }
     
      if(x<6){
    directionx=5;
      }
       
      if(x<5){
    directionx=5; 
      }
       if(y<9){
    directionx=5; 
  
  } 
  ellipse(x,y,60,60);
  fill(#FFEB86);
  

  
  
}

