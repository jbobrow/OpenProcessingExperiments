
size(599,800);

 
/* Precarga de imágenes */
  /* @pjs preload= "birdman.png", "titol.png", "titolfox.png" */
     





//CEL
noStroke();
fill(#516c81);
rect(20,20,560,760);

//LLUNA
noStroke();
fill(#688490);
ellipse(230,150,300,300);
noFill();

//MUNTANYA
noStroke();
fill(#3d5772);
triangle(23,400,375, 344, 257, 562);
triangle(375,345,582,444,213,426);
rect(23,421,356,409);
rect(315,439,264,396);
rect(33,404,462,473);
noFill();

//BIRDMAN

PImage img;
 
  tint(255,240);
  img = loadImage("birdman.png");
  image(img,260,79);
  
//LLETRES HOLLYWOOD
//H
fill(#9aaeb9);
rect(0,505,360,320);
rect(0,205,80,600);
rect(253,228,110,564);
rect(33,453,253,83);
triangle(40,434,260,446,180,505);
triangle(20,185,80,205,20,250);
triangle(253,208,253,270,363,228);
//O
rect(414,304,113,439);
quad(414,304,522,221,563,347,527,374);
quad(522,222,581,229,581,352,514,333);
quad(414,743,464,782,518,681,582,727);
quad(460,782,445,705,582,713,581,781);
noFill();

//TITOLS


  img = loadImage("titol.png");
  image(img,80,570);

  img = loadImage("titolfox.png");
  image(img,370,47);
  
fill(#425c76);
triangle(80,555,271,570,80,570);
rect(80,730,190,50);
noFill();
//MARC
stroke(#d9d5cc);
strokeWeight(60);
rect(0,0,599,800);
noFill();



