
/* @pjs preload="logo.png"; */

size (400 , 270);
PImage img;
img = loadImage("logo.png");
/*
//placing the images manually
image(img, 0, 0);
image(img, 200, 0);
image(img,0, 135);
image(img, 200, 135);
*/

//playing with making a grid from the logo
for (int i=0; i <80; i++) {
  for (int y=0; y<30; y++){
    tint(12*(.5*i), 23*y, 54*i, 34);
    image(img, i*10, y*10); 
  }
}
tint(255,63);
image (img, 100, 67.5);






