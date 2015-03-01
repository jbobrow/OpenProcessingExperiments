
/* @pjs preload="maschera.jpg, blu.jpg"; */

size (301, 640);
 
PImage maschera = loadImage ("maschera.jpg");
PImage blu = loadImage ("blu.jpg");
 
image (maschera, 0,0);
image (blu,0,0);
 
copy(maschera, 0,0,30,640, 0,0, 30, 640);
copy(maschera, 60,0,30,640,60,0,30,640);
copy(maschera, 120,0,20,640,120,0,30,640);
copy(maschera, 180,0,20,640,180,0,30,640);
copy(maschera, 300,0,20,640,300,0,30,640);
copy(maschera, 360,0,20,640,360,0,30,640);
copy(maschera, 420,0,20,640,420,0,30,640);
copy(maschera, 480,0,20,640,480,0,30,640);
copy(maschera, 540,0,20,640,540,0,30,640);
copy(maschera, 600,0,20,640,600,0,30,640);


