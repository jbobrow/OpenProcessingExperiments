
size(200,200);
background(#462020);
 int x=110;
 int y=10;
  stroke(245,0,16);
  strokeWeight(1);
 for(; x<170;x+=5){
   line(x,y,180,20);
   line(20,20,-x+200,y);
   y+=10;
 }
