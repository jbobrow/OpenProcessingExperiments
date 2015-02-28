
/* @pjs preload="mantova.jpg, bilbao.jpg"; */
size (600,420);
 
PImage mantova = loadImage ("mantova.jpg");
PImage bilbao = loadImage ("bilbao.jpg");


image (mantova, 0,0);
 
copy ( bilbao, 0,30, 600,20, 0,30, 600,30);
copy ( bilbao, 0,90, 600,20, 0,90, 600,30);
copy ( bilbao, 0,150, 600,20, 0,150, 600,30);
copy ( bilbao, 0,210, 600,20, 0,210, 600,30);
copy ( bilbao, 0,270, 600,20, 0,270, 600,30);
copy ( bilbao, 0,330, 600,20, 0,330, 600,30);
copy ( bilbao, 0,390, 600,20, 0,390, 600,30);




