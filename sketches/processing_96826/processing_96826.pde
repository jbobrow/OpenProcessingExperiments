
// Emanuele Reis - Exercício Reforço 4
 int x=-100;
 int y=5;
 
 
void setup (){
  size (200, 200);
 }
   
   void draw (){
      background (0);
     noStroke ();
  fill (#FFDC0F);
  ellipse (60, 70, 40, 40);// círculos com transparência
  fill (#FFDC0F, 100);
  ellipse (80, 70, 40, 40);
  fill (#FFDC0F, 80);
  ellipse (100, 70, 40, 40);
  fill (#FFDC0F, 60);
  ellipse (120, 70, 40, 40);
  fill (#FFDC0F, 40);
  ellipse (140,70,40,40);
   
  int spacing= 20;
  int endegs= 200;
  for (int x=-100; x<200; x=x+spacing){
    stroke (#FFDC0F);
    strokeWeight (3); 
    point (x+100,x*x/100+100);
   }
   }
