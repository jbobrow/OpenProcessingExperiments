
int x =0;
int dir =1;
void setup(){
 size(600,400); 
}

void draw(){
  background(0);
  smooth();
  ellipse(x,50,20,20);
  if (x>width){
    dir = dir *-1;
  }
  if (x<0){
    dir = dir *-1;
  }
  x = x + dir; 
}
