
int x = 0;
int y = 0; 

int xMove = 2; 
int yMove = 2;

void setup(){
  size(500,500);
} 
  
void draw(){
  background(307,115,0);
 
  noFill();
 

ellipse(250,y,10,10);
  x= x + xMove;
  y= y + yMove;
 noFill();
 
if(x>width) xMove = xMove * -1; 
if(y>width) yMove = yMove * -1;
if (x<0) xMove = xMove * -1; 
if (y<0) y = height; 

}

