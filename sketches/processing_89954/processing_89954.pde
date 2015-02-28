
void setup ()
{size ( 800, 800);
strokeWeight( 3) ;
smooth() ;
background(0,90,90);}
 
 void draw ()
 {if ( mousePressed )
 { fill (500 , 0 ,0);}
 else
{fill (255 );}
rect (mouseX ,mouseY ,10, 40);}



