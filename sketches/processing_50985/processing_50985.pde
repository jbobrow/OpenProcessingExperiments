
int x;
int directionx;
int y;
int directiony;

int x2;
int directionx2;
int y2;
int directiony2;

int x3;
int directionx3;
int y3;
int directiony3;
 
int x4;
int directionx4;
int y4;
int directiony4;

int x5;
int directionx5;
int y5;
int directiony5;
 
 
void setup(){
  size(800,600);
  x = 800;
  y = 300;
 directionx = 1;
 directiony = 1;
 
  x2 = 70;
  y2 = 9;
 directionx2 = 1;
 directiony2 = 1;
 
  x3 = 9;
  y3 = 700;
 directionx3 = 1;
 directiony3 = 1;
 
  x4 = 80;
  y4 = 10;
 directionx4 = 1;
 directiony4 = 1;
  
  x5 = 200;
  y5 = 30;
 directionx5 = 1;
 directiony5 = 1;
}
 

void draw(){
  background(mouseX,3,80);
  fill(mouseY,100,0);
  ellipse(x,y,10 + mouseY-1,10 + mouseX-1);
  x += directionx;
  y += directiony;
  if(x > 600){
     directionx = -1;
  }
  if (x < 0){
    directionx = 1;
  }
  if (y > 600){
     directiony = -1;
  }
   
  if (y < 0){
     directiony = 1;
  }
  
  fill(mouseY,mouseX,200);
  rect(x2,y2,10 + mouseY-1,10 + mouseX-1);
  x2 += directionx2;
  y2 += directiony2;
  if(x2 > 800){
     directionx2 = -1;
  }
  if (x2 < 0){
    directionx2 = 1;
  }
  if (y2 > 600){
     directiony2 = -1;
  }
   
  if (y2 < 0){
     directiony2 = 1;
  }
  
  fill(mouseY,mouseX,70);	
  ellipse(x3,y3,10 + mouseY-1,10 + mouseX-1);
  x3 += directionx3;
  y3 += directiony3;
  if(x3 > 600){
     directionx3 = -1;
  }
  if (x3 < 0){
    directionx3 = 1;
  }
  if (y3 > 600){
     directiony3 = -1;
  }
   
  if (y3 < 0){
     directiony3 = 1;
  }
  
   fill(mouseX,mouseY,110);
   ellipse(x4,y4,10 + mouseY-1,10 + mouseX-1);
  x4 += directionx4;
  y4 += directiony4;
  if(x4 > 600){
     directionx4 = -1;
  }
  if (x4 < 0){
    directionx4 = 1;
  }
  if (y4 > 600){
     directiony4 = -1;
  }
   
  if (y4 < 0){
     directiony4 = 1;
  }
  
  fill(mouseX,mouseY,240);
  rect(x5,y5,10 + mouseY-1,10 + mouseX-1);
  x5 += directionx5;
  y5 += directiony5;
  if(x5 > 600){
     directionx5 = -1;
  }
  if (x5 < 0){
    directionx5 = 1;
  }
  if (y5 > 600){
     directiony5 = -1;
  }
   
  if (y5 < 0){
     directiony5 = 1;
  }
  
   
}


