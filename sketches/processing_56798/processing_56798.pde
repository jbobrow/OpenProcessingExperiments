
/*Static shapes created by Zahrah Rashid for project 2B for YSDN1006. 
Created the static shapes using variables and loops*/
size (250, 250);
background (255);
smooth ();

int x = 5;

stroke (255,0,0);
  for (x=5;x<60;x+=10)
  {
    line (63,x,x+63,63);
    line (63,x+65,x,63);
    line (63,60-x,x,63);
    line (63,125-x,x+63,63);
    
    line (183,x,x+183,63);
    line (183,x+65,x+125,63);
    line (183,60-x,x+125,63);
    line (183,125-x,x+183,63);
    
    line (63,x+120,x+63,183);
    line (63,x+185,x,183);
    line (63,180-x,x,183);
    line (63,245-x,x+63,183);
    
    line (183,x+120,x+183,183);
    line (183,x+185,x+125,183);
    line (183,180-x,x+125,183);
    line (183,245-x,x+183,183);

  }
  stroke (0);
for (x=10;x<120;x+=20)
  {
    line (125,x,x+125,125);
    line (125,x+130,x,125);
    line (125,120-x,x,125);
    line (125,250-x,x+125,125);
  }
 rotate (PI/4);
 translate (53,-123);
  stroke (255,0,0,70);
  for (x=5;x<60;x+=10)
  {
    line (63,x,x+63,63);
    line (63,x+65,x,63);
    line (63,60-x,x,63);
    line (63,125-x,x+63,63);
    
    line (183,x,x+183,63);
    line (183,x+65,x+125,63);
    line (183,60-x,x+125,63);
    line (183,125-x,x+183,63);
    
    line (63,x+120,x+63,183);
    line (63,x+185,x,183);
    line (63,180-x,x,183);
    line (63,245-x,x+63,183);
    
    line (183,x+120,x+183,183);
    line (183,x+185,x+125,183);
    line (183,180-x,x+125,183);
    line (183,245-x,x+183,183);

  }
  


