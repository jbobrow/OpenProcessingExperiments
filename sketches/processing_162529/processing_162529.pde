
/* @pjs preload="1.png"; */
size(600,500);
background(0);
PImage haha =loadImage("1.png");
for(int h=0;h<255;h++){
      tint(h,0,100-h/5);
  image(haha,h+100,100,100,100);
  image(haha,h-250,250,100,100);
  image(haha,450-h,100,100,100);
  image(haha,200-h,300,300,300);
  image(haha,h,300,100,100);
  image(haha,200+h,-100,300,300);
  image(haha,500-h,300,100,100);
  image(haha,500-h,200,100,100);
  image(haha,h,100,100,100);
}




