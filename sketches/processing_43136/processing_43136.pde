
int x;
int directionx;
int y; 
int directiony;

void setup(){
  size(600,600);
  smooth();
  background(255,152,152);
  x = 0;
  y = 300; 
  directionx = 1;
  directiony = 1;
  
}
void draw () {
  x += directionx;
  y += directiony;
  fill(234,52,52);
  ellipse(x,y,60,60);
if(y>1){
  directionx = 1;
  directiony = 1;}
  
if(x>300){
  directionx = 1;
  directiony = -1;}
  
if(y<300){
  directionx = -1;
  directiony = -1;}
  
if(x<305){
  directionx = 1;
  directiony = 1;}
}


