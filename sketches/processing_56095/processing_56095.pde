
size (250, 250);
background (0,255,244);
smooth();
stroke(255);
strokeWeight (4);
 
int x = 10;
 
for (x=10 ; x<120 ; x+=20){
   
line (125, x,x+130, 100);
line (125, x+130, x, 150);
line (125, 120-x, x, 100);
line (125, 250-x, x+130, 150);
 
  }


