
//Monissa Chakrabartty YSDN 2012
size(250,250);
translate(125,125);
background(255);
rectMode(CENTER);
fill(0,0,30);
noStroke();
smooth();
for(int x=180; x>0;x=x-10){
  rect(0,0,x,x);
  rotate(PI/12);
  fill(90-x,0,220-x);
}


