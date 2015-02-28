
/* @pjs preload="AAA.jpg, BBB.jpg"; */
size(500,500);
PImage sfondo = loadImage("AAA.jpg");
PImage BBB = loadImage("BBB.jpg");
   
background(sfondo);
   
tint( 250,60);
image(BBB, 0,0);
save("die.jpg");


