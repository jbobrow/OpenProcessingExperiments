
//setup -- used for initial settings
void setup () {
  //size and background
size (1000,1000);
//local variables go inside code blocks
background (palette1 [int (x)]) ;
}

void draw () {
 float r = random (1, 4) ;
 strokeWeight (random (20));
 stroke (palette1 [int (r)]) ;
 ellipse (x, y, 80, 50);
 fill (palette1 [int (r)]) ;

  fill (palette1 [int (r)]) ;
  strokeWeight (15) ;
  stroke (palette1 [int (random (1,4))]);
  ellipse (x, y, 30, 30) ;
  if (x < width ) {
    x += 70 ;  
    if (x>width) {
      y +=40 ;
      x =30 ;
 }
}
}
