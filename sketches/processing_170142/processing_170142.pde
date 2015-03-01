
//Load 3 images and combine them with blend

/* @pjs preload = "basquiat.jpg, magritte.jpg, picasso.jpg"; */
 
PImage img = loadImage ("basquiat.jpg");
PImage img1 = loadImage ("magritte.jpg");
PImage img2 = loadImage ("picasso.jpg");
size (700, 700);
 
 //blend(x,y,width,height,dx,dy,dwidth,dhieght,mode)
 
img.blend (img2, 0, 0, 500, 500, 0, 200, 200, 300, SUBTRACT);
img.blend (img1, 100, 100, 700, 700, 0, 150, 100, 100, SOFT_LIGHT);
image (img, 90, 0);
filter (BLUR);



