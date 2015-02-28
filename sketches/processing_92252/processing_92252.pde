
int myState = 0 ;
PFont ProBold ;
PImage Cyber ;
PImage Circle ;


void setup() {
  size (500, 500) ;
  ProBold = loadFont("AGaramondPro-Bold-66.vlw") ;
  Cyber = loadImage("cyberspace.gif") ;
  Circle = loadImage("circle.jpg") ;
}


void draw() {
  textAlign(CENTER, CENTER) ;
    switch(myState) {
     case 0:
     background(255, 0, 0) ;
     textFont(ProBold, 30) ;
     text("An Interactive Ode To Programming", width/2, height/2) ;
     textFont(ProBold, random(20, 22)) ;
     text("Go ahead! Click away! Ahh!!", 300, 420) ;
     textFont(ProBold, 15) ;
     fill(#211414);
     text("By: Vinny-0", 250, 300) ;
     break ;
   
     case 1:
     background(#4CD1D0) ;
     textFont(ProBold, 20, 10) ;
     text("#4CD1D0 is a pretty color, is it not?", 160, 360) ;
     break ;
     
     case 2:
     image(Cyber, 0, 0, 500, 500) ;
     textFont(ProBold, 20) ;
     text("All this programming is sure making me thirsty.", 225, 100) ;
     fill(#5BF728) ;
     break ;  
     
     case 3:
     background(255, 0, 0) ;
     textFont(ProBold, 14) ;
     text("01010010011011110111001101100101 is a great instructor.", 246, 421) ;
     break ;
     
     case 4:
     image(Circle, 0, 0, 500, 500) ;
     textFont(ProBold, random(20, 22)) ;
     text("Let's do it again!", 250, 250) ;
     fill(#FA050D) ;
     break ;
  }    
}

void mousePressed() {
  myState = myState + 1 ;
  if (myState > 4) {
    myState = 0 ;
  }  
}  


