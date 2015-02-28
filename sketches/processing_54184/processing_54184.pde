
/* Pierre Pothier-Bradley - YSDN
*/ 

size (250,250);
background(255);

  smooth();
  noStroke ();
  
  //start from centre
rectMode (CENTER);
  //origin to centre 
translate(125,125);
  //loop from 190
for(int x=190; x>0;x-=10){
  //color change - light to darl
fill((x-200) *-1,0,0);
  //changing size of shape
rect(0,0,x,x);
  //chaning angle of shape
rotate (0.6);
}


