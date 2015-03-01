
/* @pjs preload="xingkong.jpg, huaduo.jpg"; */
size(850, 600);
PImage xingkong = loadImage("xingkong.jpg");
PImage huaduo = loadImage("huaduo.jpg");

background(xingkong);
tint(255, 140);
image(huaduo, 0, 0);

