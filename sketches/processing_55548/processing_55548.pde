
//Monissa Chakrabartty YSDN 2012
size (250,250);
background (255);
smooth ();
 
float x=12.5;
 
stroke (0);
 
for (x=12.5; x<125; x=x+20) {
  line (x,125,125,125-x);
    stroke(90, 40, 120);
  line (x+125,125,125,x);
    stroke(60,0, 90);
  line (x,125,125,x+125);
      stroke(120,10, 120);
  line (x+125,125,125,250-x);
      stroke(0, 0, 0);
}
 
translate (125,125);


