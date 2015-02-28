
/* Amirreza Chabouk
   YSDN - Winter 2012
*/

size (250,250);
background (255);
smooth ();
 
float x=12.5;
 
stroke (0);
 
for (x=12.5; x<125; x=x+20) {
  line (x,125,125,125-x);
  line (x+125,125,125,x);
  line (x,125,125,x+125);
  line (x+125,125,125,250-x);
}
 
translate (125,125);


