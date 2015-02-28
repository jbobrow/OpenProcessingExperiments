
size(200,200);
background(0,0,255);
 int x=130;
 int y=20;
  stroke(255,255,0);
  strokeWeight(5);
 for(; x<200;x+=10){
   line(x,y,195,20);
   line(10,20,-x+200,y);
   y+=15;
 }
