
size(200,200);
background(#363636);
 int x=110;
 int y=20;
  stroke(#FF7F00);
  strokeWeight(1);
 for(; x<200;x+=10){
   line(x,y,180,20);
   line(10,20,-x+200,y);
   y+=15;
 }
