
/* @pjs preload="bubs.jpg; */

size(600,400);
PImage bubs;
bubs = loadImage("bubs.jpg");
image(bubs,0,0,600,400);
tint(255,100);
image(bubs,200,-100,600,400);
tint(154,253,208,70);
image(bubs,-200,100,600,400);
tint(255,70);
image(bubs,-200,200,600,400);
tint(100,153,204,70);
image(bubs,200,-200,600,400);


