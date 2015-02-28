
/* Done by Amirreza Chabouk
211567401
YSDN
Winter 2012*/
size(250,250);
translate(125,125);
background(0,18,37);
rectMode(CENTER);
fill(0,18,37);
noStroke();
smooth();
for(int x=180; x>0;x=x-10){
  rect(0,0,x,x);
  rotate(PI/5);
  fill(180-x,21,43);
}


