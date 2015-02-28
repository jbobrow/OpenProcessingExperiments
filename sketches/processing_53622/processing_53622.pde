
size(250,250);
translate(125,125);
background(255);
rectMode(CENTER);
fill(0,0,0);
noStroke();
smooth();
for(int x=180; x>0;x=x-10){
  ellipse(10,0,x,x);
/*Rectangle decreases in height & width by 10px*/
  rotate(PI/6);
/*Rectangle rotates 30 degrees (PI/6)*/
  fill(0,190-x,0);
/*R value for fill increases every time x changes */
}


