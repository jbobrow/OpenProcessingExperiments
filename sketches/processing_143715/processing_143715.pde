

/* @pjs preload="tian.jpg, ren.jpg"; */
size (300, 200);
 
PImage sfondo = loadImage ("tian.jpg");
PImage ren = loadImage ("ren.jpg");
 
background (sfondo);
tint (255, 170);
image (ren, 0, 0);



