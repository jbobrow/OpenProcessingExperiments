
/* @pjs preload= "swallow.jpg"; */

size(240, 380);
triangle(0, 20, 140, 80, 60, 140);
quad(60, 140, 140, 80, 220, 260, 120, 300);
triangle(120, 300, 140, 292, 140, 320);
triangle(140, 292, 180, 276, 180, 320);
triangle(180, 276, 220, 260, 220, 300);
triangle(239, 379, 210, 360, 230, 355);
triangle(200, 320, 220, 330, 220, 310);
triangle(160, 345, 180, 340, 180, 370);
PImage img;
  img = loadImage("swallow.jpg");
  image(img, 100, 150, 70, 90);



