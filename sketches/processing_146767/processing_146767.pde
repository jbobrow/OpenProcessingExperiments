
/*Static shapes created by Zahrah Rashid for project 2B for YSDN1006. 
Created the static shapes using variables and loops.*/
size(250,250);

background(255);

translate(125,125);

rectMode(CENTER);
stroke(0,60,60);
fill(0,60,60);
for(int x=180; x>0;x-=10){
  rect(0,0,x,x);
  rotate(PI/0.6);
  stroke(255-x,255-x,0);
  fill(0,255-x,255-x);
}


