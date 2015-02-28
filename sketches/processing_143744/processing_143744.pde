
/* @pjs preload="giorno.jpg, notte.jpg"; */
size (621,900);

PImage giorno = loadImage ("giorno.jpg");
PImage notte = loadImage ("notte.jpg");

image (notte, 0,0);

copy ( giorno, 0,30, 621,30, 0,30, 621,30);
copy ( giorno, 0,90, 621,30, 0,90, 621,30);
copy ( giorno, 0,150, 621,30, 0,150, 621,30);
copy ( giorno, 0,210, 621,30, 0,210, 621,30);
copy ( giorno, 0,270, 621,30, 0,270, 621,30);
copy ( giorno, 0,330, 621,30, 0,330, 621,30);
copy ( giorno, 0,390, 621,30, 0,390, 621,30);
copy ( giorno, 0,450, 621,30, 0,450, 621,30);
copy ( giorno, 0,510, 621,30, 0,510, 621,30);
copy ( giorno, 0,570, 621,30, 0,570, 621,30);
copy ( giorno, 0,630, 621,30, 0,630, 621,30);
copy ( giorno, 0,690, 621,30, 0,690, 621,30);
copy ( giorno, 0,750, 621,30, 0,750, 621,30);
copy ( giorno, 0,810, 621,30, 0,810, 621,30);
copy ( giorno, 0,870, 621,30, 0,870, 621,30);

save ("doppio.jpg");



