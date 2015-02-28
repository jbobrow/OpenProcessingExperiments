
int x;
int directionx;
int y;
int directiony;


void setup(){
  size(900,800);
  x = 170;
  y = 38;
 directionx = 1; 
 directiony = 1;
}

void draw(){
  background(mouseX,3,80);
  ellipse(x,y,10 + mouseY-1,10 + mouseX-1);
  x += directionx;
  y += directiony;
  if(x > 900){
     directionx = -1; 
  }
  if (x < 0){
    directionx = 1;
  }
  if (y > 800){
     directiony = -1;
  }
  
  if (y < 0){
     directiony = 1; 
  }
     
  
}

