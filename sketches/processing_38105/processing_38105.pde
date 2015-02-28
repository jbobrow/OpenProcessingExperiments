
/*Joseph Kotay. Practice Computational Methods. Nested Loops.  Professor Nick SenseKe
 This sketch uses a single loop pattern of lines, and a nested loop grid pattern of diamond
 shaped quadrangles.  I took the idea from patterns I found on an online gallery called
 Mind Design, which can be viewed at http://minddesign.co.uk/show.php?id=172&pos=6&cat=2.
 The site doesn't provide any code.  The site just exhibits cool pattrens and graphics.*/

size(400, 400);
smooth();
background(170,100,30);

strokeWeight(5);

//Single loop pattern of lines.

for(int lineX = 0; lineX <= width; lineX+= 10) {
  line(lineX, 0, lineX, height);
}

/*Nested loop pattern of diamond shapes. I tested a couple of different stroke and fill commands
 to alter the composition. 
 
 Try a few tests by copy and pasting the code into your Processing window.*/

strokeWeight(3);
noStroke();
fill(170,100,30);
//fill(30,170,42);

for(int quadX = 0; quadX<= width; quadX+=width/4) {
  for(int quadY = 0; quadY <= height; quadY+=width/5) {
    quad(quadX, quadY+40, quadX + 50, quadY + 80, quadX + 100, quadY + 40,
    quadX + 50, quadY);
  }
}


