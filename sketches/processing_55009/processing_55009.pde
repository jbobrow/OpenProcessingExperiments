
/* Code-1 by Sarah Sia
York/Sheridan Joint Program in Design */

size(250,250);
background(#795E4E);
// starting at 10, and as long a is less than 120,  will add up 20 every time.
for(int a=10; a<120;a+=20)

{
//top right
  stroke(#FCFCFC);
  line(125,a,a+130,125);
//top left
  stroke(#B7B5B7);
  line(125,a+130,a,125);
//bottom right
  stroke(#FFC6F5);
  line(125,-a+120,a,125);
//bottom left
  stroke(#FFE874);
  line(125,250-a,a+130,125);
}
 
                


