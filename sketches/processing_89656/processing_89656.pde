
PFont bask ; //nickname
PImage cat ; //nickname

int x = 10 ;

void setup() { 
  
size(610, 450) ;  

cat = loadImage("patchymeow.jpg") ;  

  
}


void draw() {   
  
image(cat, 0, 0) ;  
  
size(750, 500) ;

bask = loadFont("Baskerville-124.vlw") ;

textFont(bask, 120) ;

text("Hey, you're not dead, you're doing good, damned good again, what's this talk of tossing it in? What you were doing while you were feeling sick enough to die, what you were really doing was really just re-charging your batteries.", x, 400) ;  

x = x - 7 ;

if (x < -10600) {
  x = 0 ;
}
}




