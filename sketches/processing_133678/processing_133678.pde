
/* @pjs preload="sophie1.jpg";*/

PImage sophie1 ;
int x=0 ;
PFont message;


void setup () {
size (990, 685) ;
sophie1= loadImage ("sophie1.jpg") ;
message= createFont("whiterabbit.ttf", 128);
}

void draw () {
background(100);
  image(sophie1, 0, 0) ;
 textFont(message, 200);
 text ("Cute Panda", x, 500) ;
  x= x-1; 
 if (x < -990){
  x= width; 
 }
}

