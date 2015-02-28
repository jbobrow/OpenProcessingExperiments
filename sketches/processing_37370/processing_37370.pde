
int x;
int y;
int dirX;
int dirY;

void setup(){
  size(600,600);
  smooth();
  fill(255);
  x=50;
  y=133;
  //assign
  dirX=1;
  dirY=1;
}

void draw(){
  background(x);
  x +=dirX;
  y +=dirY;
  rect(x,y,150,50);
  
  if(y > 600){
   dirY=-1;
  } 
  
  if(y < 1){
    dirY=1;
  }
  if(x > 600){
    dirX=-1;
  }
  if(x < 1){
    dirX=1;
  }

}



