
//Raidel Calayag, Reapeating Loops, CP1, Block 6
//url: http://argentxorion.webs.com/Repeating Assignment/bluethingthatrepeats.html

/**
 <pre>
 
 This is my flower thing repeating thing that I made :D
 
 II            IIIIIIIIIIII    II
 II            II        II    II
 II            II        II    II
 II            II        II    II
 II            II        II    II
 IIIIIIIIII    IIIIIIIIIIII    IIIIIIIIIIII
 
 Enjoy It :3
 
 */


size(600, 600);
noFill();
smooth();

//Base ( Circle )
noStroke();
fill(255, 255, 255, 100);
ellipse(300, 300, 600, 600);

fill(82, 142, 141, 200);
noStroke();
ellipse(300, 300, 400, 400);




//Base ( Petals )
stroke(80, 193, 192);
noFill();
int x = 580;
while (x>9)
{
  int y =580;
  while (y>9)
  {
    line(x, y, 300, 300);
    y = y - 6;
  }
  x = x - 6;
}

//Inner Base
stroke(255, 255, 255);
int w2 = 10;
while (w2<250)
{
  int h2 = 10;
  while (h2<250)
  {
    ellipse(300, 300, w2, h2);
    h2 = h2 + 25;
  }
  w2 = w2 + 25;
}


//Outer Base

stroke(200, 200, 200, 100);
int w3 = 50;
while (w3<300)
{
  int h3 = 50;
  while (h3<300)
  {
    ellipse(300, 300, w3, h3);
    h3 = h3 + 25;
  }
  w3 = w3 + 25;
}

stroke(215, 215, 215, 90); 
int w4 = 10;
while (w4<400)
{
  int h4 = 10;
  while (h4<400)
  {
    ellipse(300, 300, w4, h4);
    h4 = h4 + 25;
  }
  w4 = w4 + 25;
}

stroke(3, 97, 95, 100);
int w5 = 10;
while (w5<100)
{
  int h5 = 10;
  while (h5<100)
  {
    ellipse(300, 300, w5, h5);
    h5 = h5 + 25;
  }
  w5 = w5 + 25;
}
