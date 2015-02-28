
//Mira A, Loop, CP1, Mods 16/17

//integers
int rd = 0;
int gr = 0;
int bl = 80;
int circ = 10;

//setup
size(500,500);
background(255);
noFill();

//pattern
while (circ < 601)
{
  stroke(rd+10,gr+10,bl);
  ellipse(240+circ,240+circ,circ,circ);
  ellipse(260-circ,260-circ,circ,circ);
  ellipse(240+circ,260-circ,circ,circ);
  ellipse(260-circ,240+circ,circ,circ);
  ellipse(250,240+circ,circ,circ);
  ellipse(250,260-circ,circ,circ);
  ellipse(240+circ,250,circ,circ);
  ellipse(260-circ,250,circ,circ);
  ellipse(250,250,circ,circ);
  ellipse(250,250,10+circ,10+circ);
  rd = rd + 5;
  gr = gr + 10;
  bl = bl + 10;
  circ = circ + 10;
}
