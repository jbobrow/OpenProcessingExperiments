
//Anthony Hernandez
//September 28, 2011
//Bouncing Ball

int directionx;
int x;
int directiony;
int y;
 
void setup (){
   size(500,500);
   background(0);
   colorMode(HSB);
    x = 10;
directionx= 1;
  y=150;
  directiony=1;
  y=200;
}
 
void draw(){
  background(0);
  x += directionx;
  y += directiony;
  ellipse(x,y,100,100);
  fill(random(255),250,150,200);
  
if(y>500){
  directionx= 1;
  directiony= -1;}
if(x>500){
  directionx = -1;
  directiony = -1;}
if(y<1){
  directionx = -1;
  directiony = 1;}
if(x<1){
  directionx= 1;
  directiony= 1;}
} 

