
/* 
optical illusion
by 
Adriano Parracciani
*/

size(560,560);
int step=20;
int alpha=0;
for (int i=0; i<560; i=i+40) {
  stroke(255,0,0);
  strokeWeight(4);
  line (0,i, width, i);
}
noStroke();
for (int y=0; y<560; y=y+40) {
  for (int x=0; x<560; x=x+80) {
  fill(0,0,255);
  rect (x+alpha, y+2, 38, 38);
  }  
  alpha=alpha+step;
   if (alpha==40){
    step=-20;
  } 
  if (alpha==0){
    step=20;
  } 
 }
