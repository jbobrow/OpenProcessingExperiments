
/* @pjs preload="minion.jpg"; font="Frijole-Regular.ttf";*/

PImage minion ;
int myState= 0 ;
int count= 120;
float x1= 200; 
PFont sass;


void setup () {
size (480, 640) ;
minion= loadImage ("minion.jpg") ;
sass =createFont ("Frijole-Regular.ttf",80);
textFont(sass, 20);

}
void draw() {
 
 count = count - 1 ;
  if (count < 0) {
    myState = myState + 1 ;
    if (myState > 4) {
      myState = 0 ;
    }
    count = 120 ;
  }
 

 background(255);
 
  switch(myState) {
 
  case 0:
    fill (#1A43B9);
    text ("Keep your eyes on the minion", 40, 40);
    image(minion, 240, 0);
    break;
 
  case 1:
    image(minion, 0, 10) ;
    break;
 
  case 2:
    image(minion, 0, 400) ;
    break;
 
  case 3:
     image(minion, -50, -450) ;
    break;
 
  case 4:
    image(minion, -40, 300) ;
    break;
  }

}


