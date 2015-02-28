
/* @pjs preload="giorno.jpg, notte.jpg"; */
size (621,900);

PImage giorno = loadImage ("giorno.jpg");
PImage notte = loadImage ("notte.jpg");

background (giorno);

tint (255,0,100, 100);
image (notte, 0,0);



