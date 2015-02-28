
int x=-100;
 int y=5;
  void setup (){
  size (200, 200);
 }
    
   void draw (){
      background (#363636);
     noStroke ();
  fill (#00FF7F);
  ellipse (50, 60, 35,35);
  fill (#00FF7F, 100);
  ellipse (70, 60, 35,35);
  fill (#00FF7F, 80);
  ellipse (90, 60, 35,35);
  fill (#00FF7F, 60);
  ellipse (110, 60, 35, 35);
  fill (#00FF7F, 40);
  ellipse (130,60,35,35);
  fill (#00FF7F, 20);
  ellipse (150, 60, 35, 35);
    
  int spacing= 10;
  int endegs= 200;
  for (int x=-100; x<200; x=x+spacing){
    stroke (#40E0D0);
    strokeWeight (5);
    point (x+100,x*x/100+100);
   }
   }
