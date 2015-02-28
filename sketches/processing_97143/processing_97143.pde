
size(200,200);
background(151, 12, 245);
 int x=110;
 int y=10;
  stroke(250, 221, 103);
  strokeWeight(2);
 for(; x<200;x+=10){
   line(x,y,190,10);
   line(10,10,-x+200,y);
   y+=17;
 }
