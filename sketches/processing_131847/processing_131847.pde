
/* @pjs preload= "Deb_Volume_02.png", "Deb_Volume_01.png", "Deb_Glitched_03.png", "Deb_Glitched_01.png"; */

size(720, 730) ;
ellipse(278, -100, 400, 400) ;
ellipse(120, 100, 110, 110) ;
ellipse(600, 930, 600, 600) ;
PImage img;
  img = loadImage("Deb_Volume_02.png");
  image(img, 170, 20);
  img = loadImage("Deb_Volume_01.png");
  image(img, 50, 160);
  img = loadImage("Deb_Glitched_03.png");
  image(img, 300, 340);
  img = loadImage("Deb_Glitched_01.png");
  image(img, 400, 460, 120, 250);



