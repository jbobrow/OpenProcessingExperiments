
/* @pjs preload="moonphase.jpg"; font = "Neou-Thin.ttf";  */

int myState = 0 ;
PImage  moon;
PFont  neou;


void setup() {
  size(200, 687) ; 
  
   



 moon = loadImage("moonphase.jpg");
 neou = createFont("Neou-Thin.ttf", 20);
   textFont(neou);
        textAlign(CENTER, CENTER) ;

}


void draw() {
  switch(myState) {
    case 0:

    image(moon, -1, 0, 1600, 687);
    fill(#ffffff);
       text("Dead Moon", 100, 600) ;

    break ;
    
    case 1:
       image(moon, -200, 0, 1600, 687);
fill(#ffffff);
       text("Dead Moon", 100, 600) ;
    break ;

    case 2:
       image(moon, -440, 0, 1600, 687);
fill(#ffffff);
       text("Dead Moon", 100, 600) ;
    break ;
    
    case 3:
           image(moon, -710, 0, 1600, 687);
        fill(#ffffff);
       text("Dead Moon", 100, 600) ;
break ;

case 4:
           image(moon, -1000, 0, 1600, 687);
fill(#ffffff);
       text("Dead Moon", 100, 600) ;
break ;

case 5:
           image(moon, -1195, 0, 1600, 687);
fill(#ffffff);
       text("Dead Moon", 100, 600) ;
break;

case 6:
           image(moon, -1400, 0, 1600, 687);
fill(#ffffff);
       text("Dead Moon", 100, 600) ;
break;
  }
  
}

void keyPressed() {
  myState = myState + 1 ;
  if (myState > 6) {
    myState = 0 ;
  }
}


