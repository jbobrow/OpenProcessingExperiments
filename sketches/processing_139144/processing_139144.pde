
/* @pjs preload="11.png"; */


PImage img1;
img1=loadImage("11.png");

color c1,c2,c3;

size(480,480);
background(255);
c1=color(190,180,150);
c2=color(190,255,255);
c3=color(150,240,190);
c4=color(100,220,110);
c5=color(90,90,120);


tint(c1);
image(img1,0,0,480,240);
tint(c2);
image(img1,0,120,480,240);
tint(c3);
image(img1,0,240,480,240);
tint(c4);
image(img1,0,360,480,240);
tint(c5);
image(img1,0,-120,480,240);




