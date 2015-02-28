
int x=-100;
 int y=05;
 void setup (){
  size (200, 200);
  background (67,5,90);
}
    
 void draw (){         
  int spacing=15;
    stroke (241,242,7);
  strokeWeight(4);
   for (int x=-100; x<200; x=x+spacing){    
    point (x+100,x*x/100+100);
   }
    noStroke ();
   fill (241,242,7,5);
      for (int i=50; i<170; i=i+25){
            ellipse (i, 60, 43, 40);
    }
 }
