
/* Pierre Pothier-Bradley
   YSDN York Sheridan Program in Design
*/
background (255);
size (250, 250);


fill (44,146,232);
rect (125,125,175,175);
smooth (); 
noStroke ();
//blue box  

fill (44,146,232);
rect (0,0,125,125);
noStroke ();
//blue box  

stroke (122,126,129);
strokeWeight (3);
line (30,125,250,125);
smooth (); 
//line across

stroke (122,126,129);
strokeWeight (3);
line (125,20,125,275);
smooth (); 
//line across

noFill ();
strokeWeight (80);
stroke (3,3,3);
ellipse (125,125,250,250); 

noFill ();
strokeWeight (100);
stroke (255);
ellipse (125,125,350,350); 


