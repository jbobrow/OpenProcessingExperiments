
/* @pjs preload="kiss.jpg, bacio.jpg"; */
size (600, 640);

PImage bacio = loadImage ("bacio.jpg");
PImage kiss = loadImage ("kiss.jpg");

image ( bacio, 0,0);
image (kiss,0,0);

copy(bacio, 0,0,30,640, 0,0, 30, 640);
copy(bacio, 60,0,30,640,60,0,30,640);
copy(bacio, 120,0,20,640,120,0,30,640);
copy(bacio, 180,0,20,640,180,0,30,640);
copy(bacio, 240,0,20,640,240,0,30,640);
copy(bacio, 300,0,20,640,300,0,30,640);
copy(bacio, 360,0,20,640,360,0,30,640);
copy(bacio, 420,0,20,640,420,0,30,640);
copy(bacio, 480,0,20,640,480,0,30,640);
copy(bacio, 540,0,20,640,540,0,30,640);
copy(bacio, 600,0,20,640,600,0,30,640);


