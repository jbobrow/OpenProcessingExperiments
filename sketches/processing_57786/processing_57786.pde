
size(250,250);
translate(125,125);
background(255);
rectMode(CENTER);
fill(60,0,0);
noStroke();
smooth();
 
 
for(int x=180; x>0;x=x-10)
 
{
  rect(0,0,x,x);
 
  rotate(PI/6);
 
  fill(260-x,0,0);
 
}

