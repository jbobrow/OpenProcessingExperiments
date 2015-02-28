

size(250,250);
background(255);
smooth();
noStroke();

rectMode (CENTER);
translate(125,125);
for(int x=180; x>0;x-=10){  
  fill((x-255)*-1,0,0);
  rect(0,0,x,x);
  rotate (0.5);
}
