
int num = int ((random (500))); // number of tears
Tears [] theTears; //tears array

void setup () {
  size (500, 500) ;
  smooth () ;
  colorMode (HSB) ;
  theTears = new Tears [num] ;
  for (int i = 0; i < num; i++) {
     theTears [i] = new Tears () ;
  }
}

void draw () {
   background (random (255)) ;
   for(int i = 0; i < num; i ++ ) {
     theTears [i] .draw () ;
     theTears [i] .fall () ;

   }
} 

class Tears {
  color cul;
  int x ;
  int y ;
  int speed ; 
  int wi ;
  

  
  Tears () {
    cul = color (random (100) + 140, 65 , 80) ; 
    speed = int (random (1 + 10)) ;
    x = int (random (width)) ;
    y = int (random (width)) ;
    wi = int (random (10) + 10) ; 
   
  }
 
 // methods

 void draw () {
   // drawing tears
    noStroke () ;
    fill (cul) ;
    ellipse (x, y, wi, wi) ; //draws base of tear
    triangle (x - wi / 2, y, x + wi / 2, y, x, y - 3 * wi) ;  //draws top of tear
  }



void fall () {
    y += (random(20)) ;
    if (y > 525) {
    y = -25;
    }
  }
}
