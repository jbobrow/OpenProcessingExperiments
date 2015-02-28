
/*Nathana L. Czornei
Exercício sobre Padrões - 19.02.13
*/
void setup(){
size(200,200);
background(255);
frameRate(5);
}
int i;
int e;
int c;
int a=0;

void draw(){
for(i=0;i<200;i+=30)
  for(c=-180;c<185;c+=60){
  fill(i);
  noStroke();
  rect(i,i+c,30+a/2,30+a/2);
  if(a<40){
    a++;
  }
    else{
      a=0;
      
    }
  
 }
for(e=0;e<200;e+=30){
   for(c=-180;c<185;c+=60){
fill(51+e,01,374,30);
ellipse(e,e+c,50,50);

}
}

}


