
// variables
int a = 0;
int b = 0;
int c = 0;
int d = 0;
 
int leTemps=0;

void setup(){
 
  size(500,600);
  background(255);
   
  rectMode(CENTER);
 
}
 
void draw(){
  
  translate(mouseX,mouseY);
  rotate(leTemps);
  fill(#018985,40);
  /*Partage l'écran en deux, plus on s'approche du
  centre plus le cercle se concentre et plus on s'en
  éloigne plus il est grand
  */
  rect(mouseX-width/2,mouseY-height/2,20,20);
  a = mouseX * 2 -300;
  b = mouseY /3 +100;
  c = mouseX /2;
  d = mouseY;
  line(a,b,c,d);
  
 leTemps++;
//tourne en boucle
}


