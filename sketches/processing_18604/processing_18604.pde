
void setup () {
  size(300,300) ;
 }
void draw() {
  background(255-mouseY,255,mouseY+255) ;
 smooth ();

fill(117,111,219)  ;
ellipse(150,mouseY,20,30) ;
  fill(220,255-mouseY,255) ;
ellipse(150,300-mouseY,20,30) ;
fill(255,0,0);
ellipse(160,-mouseY+300,20,5) ;
ellipse(140,-mouseY+300,20,5) ;
ellipse(145,10-mouseY+300,5,26) ;
ellipse(155,10-mouseY+300,5,26) ;
ellipse(155,5+mouseY+300,5,1) ;

fill(0,255,0);
rect(150,-mouseY+300,3,150);
 
 
  fill(mouseY,0+mouseY*3,0+mouseY/2) ;
  rect(0,150,300, 200) ;

  fill(mouseY,40+mouseY,255-mouseY) ;
ellipse(150,-mouseY+300,20,30) ;


}



