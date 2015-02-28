
size(200,200);
background(#AA90B7);
 int x=140;
 int y=40;
   
 for(; x<200;x+=10){
 stroke (250);
strokeWeight (3);
   line(x,y,185,15);
   
   line(10,10,-x+200,y);
   y+=25;
 }
