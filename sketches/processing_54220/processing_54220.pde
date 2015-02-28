
/* by: Gina Kim
YSDN 1006 Interactivity Design 3.0
Prof. Borzu
Feb.29, 2012
*/

size(250,250);
background(255,200,100);
strokeWeight(2);
smooth();
rectMode(CENTER);
fill(50,0,0);
translate(125,125);
for(int x=180; x>0;x-=10){
fill((x-255)*-1,0,0);
rect(0,0,x,x);
rotate (0.5);
}


