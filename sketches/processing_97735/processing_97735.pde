
// giovanna simokado
size (200,200);
  background (255);
  int y=10;
   
  for (int x= 50; x<150; x=x+20){
    noStroke ();
  fill (y*y,y*y,0,y*y/3);
  ellipse (x,50,50,50);
  y=y+2;
  }
  
  for (int a=-50; a<200; a=a+1) {
    strokeWeight (3);
    stroke (0);
    point (a*10+100,a*a+100/1);}
