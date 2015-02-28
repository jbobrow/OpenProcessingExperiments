
int x1 = -500 ;
int y1 = 0 ;
int x2 = -500 ;
int y2 = 0 ;
int x3 = -500 ;
int y3 =  0 ;
int x4 = -800 ;
int y4 = 0 ;
PImage redCross ;
PImage greenHammers ;
PImage yellowC ;
PImage blankHawks ;
int myState = 0 ;
PFont hawkfont ;


void setup() {
size(500, 500) ;
background(#FFFFFF) ;
blankHawks = loadImage("blankHawks.png") ;
redCross = loadImage("redCross.png") ;
yellowC = loadImage("yellowC.png") ;
greenHammers = loadImage("greenHammers.png") ;
}

void draw()  {
  background(#ffffff) ;
  switch(myState) {
   
   case 0:
  size(500,500) ; 
  break;
  
  
   case 1:
    image(blankHawks, x1, y1, 500, 500) ;
    x1 = x1 + 20 ;
  if (x1 > -1){
      x1 = 0 ;
}
break;

    case 2:
  image(yellowC, x2, y2, 500, 500) ;
  image(blankHawks, x1, y1, 500, 500) ;

   x2 = x2 + 25 ;
  if (x2 > -1){
      x2 = 0 ;
}
break;


  case 3:
image(redCross, x3, y3, 499, 500 ) ;
image(yellowC, x2, y2, 500, 500) ;
image(blankHawks, x1, y1, 500, 500) ;
x3 = x3 + 25 ;
if (x3 > -1) {
x3 = 0 ;
}
break ;

  case 4:
image(greenHammers, x4, y4, 500, 500) ;
image(redCross, x3, y3, 499, 500 ) ;
image(yellowC, x2, y2, 500, 500) ;
image(blankHawks, x1, y1, 500, 500) ;
x4 = x4 + 25 ;
if (x4 > -1) {
x4 = 0 ;
    }
break;

case 5:
    image(blankHawks, 0, 0, 500, 500) ;
   

break;

    case 6:
  image(yellowC, x2, y2, 500, 500) ;
  image(blankHawks, x1, y1, 500, 500) ;

   x2 = x2 + 25 ;
  if (x2 > -1){
      x2 = 0 ;
}
break;


  case 7:
image(redCross, x3, y3, 499, 500 ) ;
image(yellowC, x2, y2, 500, 500) ;
image(blankHawks, x1, y1, 500, 500) ;
x3 = x3 + 25 ;
if (x3 > -1) {
x3 = 0 ;
}
break ;

  case 8:
image(greenHammers, x4, y4, 500, 500) ;
image(redCross, x3, y3, 499, 500 ) ;
image(yellowC, x2, y2, 500, 500) ;
image(blankHawks, x1, y1, 500, 500) ;
x4 = x4 + 25 ;
if (x4 > -1) {
x4 = 0 ;
}
break;
}
}

void mousePressed() {
 myState = (myState + 1) ; 
  if (myState > 4) {
     myState = 0 ; 
   }
}



