
/* @pjs preload="veg.jpg,couple.jpg,eye.jpg"; */
 
size(600,300);
  
PImage img = loadImage("veg.jpg");
PImage img2 = loadImage("couple.jpg");
PImage img3 = loadImage("eye.jpg");
img.blend(img2, 10,0, 245, 30, -25,0,190,190,BLEND);
img.blend(img2, 0,10, 545, 300, 115,0,93,175,BLEND);
img.blend(img2, 10,0, 145, 30, -55,0,300,905,DODGE);
img.blend(img2, 0,10, 9145, 300, 215,222,325,325,OVERLAY);

image(img, 0,0,600,300);



