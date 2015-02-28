
/* @pjs preload= "url.jpg"; */

size(300,200);
  stroke(0,0,0);
  fill(100,0,0);
  

ellipse(30, 21, 30, 30);
ellipse(70, 51, 30, 30);
ellipse(110, 21, 30, 30);
ellipse(150, 51, 30, 30);
ellipse(190, 21, 30, 30);
ellipse(230, 51, 30, 30);
ellipse(270, 21, 30, 30);

fill(0,100,0);
ellipse(110, 81, 30, 30);
ellipse(190, 81, 30, 30);

fill(100,0,0);
ellipse(150, 111, 30, 30);

PImage img;
  img = loadImage("url.jpg");
  image(img, 136, 141, 30, 30);



