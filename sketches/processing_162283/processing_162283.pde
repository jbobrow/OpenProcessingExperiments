
/* @pjs preload="4.png"; */
size(700,300);
background(255);
PImage img;
img=loadImage("4.png");
tint(150,120,40,150);
for(int i=0;i<11;i++){
   image(img,i*80-90,0);
}



