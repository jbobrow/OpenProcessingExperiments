
size(200,200);
background(#462020);
 int x=110;
 int y=20;
  stroke(#646481);
  strokeWeight(1);
 for(; x<200;x+=5){
   line(x,y,180,20);
   line(20,20,-x+200,y);
   y+=20;
 }
