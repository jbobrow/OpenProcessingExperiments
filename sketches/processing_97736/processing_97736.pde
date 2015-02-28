
//Patrícia Reforço 05
size(200,200);
background(0);
 int x=100;
 int y=10;
  
 for(;x<200;x+=15){
   stroke(250);
   strokeWeight (3);

 line(x,y,195,15);
   line(10,10,-x+195,y);
   y+=25;
 }
