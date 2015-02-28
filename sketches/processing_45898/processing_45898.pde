
/* faire un cadre noir  lorsqu 'on clique dessus, des ronds
erts apparaissent de manière alétoire, symbole des virus ; utiliser boolean */

PFont maTypo ;
 color a1= color (57, 240,58 ) ;


void setup () {
  size (900, 900) ;
  smooth () ;
  PFont maTypo=createFont( "Aharoni-Bold",55) ;
  textFont (maTypo, 55) ;
  
}

void draw () {

fill(a1) ;
  if (mousePressed){
  background(0) ;
  
  text ( "Virus Detected,we are killing you !", 30,screen.height/2 );
} else{
  for  ( int x=10; x<screen.width ; x+=10) {
    for (int y= 10 ;y<screen.height ; y+=10){
  ellipse(x ,y ,random (10),random (10) ) ; 
  }}}
}

