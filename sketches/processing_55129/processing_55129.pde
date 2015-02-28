
size(250,250);
background(255);
smooth();
noStroke();
rectMode (CENTER);
translate(125,125);

// x decreases by 10 

for(int i=180; i>0;i-=3){
  fill((i-225)*-1,104,132);
  rect(0,0,i,i);
  rotate (0.4);
}


