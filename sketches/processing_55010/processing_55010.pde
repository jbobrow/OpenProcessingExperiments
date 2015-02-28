
/* Code-2 by Sarah Sia
York/
Sheridan Joint Program in Design */

size(250,250);
background(#0BA00C);
translate(125,125);
rectMode(CENTER);
fill(60,0,0);
smooth();
stroke(0);
//begin x at 180 & as long x is greater than 0, subtract 10*/
for(int x=180; x>0;x-=10){
  rect(0,0,x,x);
  
  rotate(PI/0.6);
 
  fill(255-x,0,0);
}


