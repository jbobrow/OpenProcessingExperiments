
/* by: Gina Kim
YSDN 1006 Interactivity Design 3.0
Prof. Borzu
Feb.29, 2012
*/

background (30,120,700);
size (250,250);
for(int a = 10; a < 120; a += 20) {  
 stroke (200); 
 strokeWeight(1);

  line (125, a, a+130, 125);

  line (125, a+130, a, 125);
  stroke(300,29,39,100);
  strokeWeight(2);
  line (125, -a+120, a, 125);

  line (125, 250-a, a+130, 125);
}

