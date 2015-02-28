
/*Nathana L. Czornei
Exercício sobre Padrões - 19.02.13
*/
size(200,200);
background(255);
int i;
int e;
for(i=0;i<200;i+=30){
  fill(i);
  noStroke();
  rect(i,i-180,30,30);
  rect(i,i-120,30,30);
  rect(i,i-60,30,30);
  rect(i,i,30,30);
  rect(i,i+60,30,30);
  rect(i,i+120,30,30);
  rect(i,i+180,30,30);
}
for(e=0;e<200;e+=30){
fill(51+e,01,374,50);
ellipse(e,e-180,50,50);
ellipse(e,e-120,50,50);
ellipse(e,e-60,50,50);
ellipse(e,e,50,50);
ellipse(e,e+60,50,50);
ellipse(e,e+120,50,50);
ellipse(e,e+180,50,50);
}






