
// Emanuele Reis - Exercício Reforço 4
 int x=-100;
  
 void setup (){
  size (200, 200);
 }
    void draw (){
      background (0);
     noStroke ();
     
  for (int i=60; i<160; i=i+20){
  fill (#FFDC0F, i+40);
  ellipse (i, 70, 40, 40);
  }
  int spacing= 20;
  int endegs= 200;
  for (int x=-100; x<200; x=x+spacing){
    stroke (#FFDC0F);
    strokeWeight (3); 
    point (x+100,x*x/100+100);
   }
   }
