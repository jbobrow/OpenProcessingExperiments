
int directionx;
int x;
int directiony;
int y;

void setup (){
   size(600,600);
    x = 50;
directionx= 1;
  y=300;
  directiony=1;
}

void draw(){
  x += directionx;
  y += directiony;
  ellipse(x,y,40,40);
if(y>580){
  directionx= 1;
  directiony= -1;}
if(x>580){
  directionx = -1;
  directiony = -1;}
if(y<20){
  directionx = -1;
  directiony = 1;}
if(x<30){
  directionx= 1;
  directiony= 1;} 
}  

