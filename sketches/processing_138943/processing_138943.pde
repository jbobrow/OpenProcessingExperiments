


/*@pjs preload="1.jpg";*/

size (400,400);
PImage img;

img = loadImage("1.jpg");
background(255);
for (int i = 0; i < 40; i+=5) {
  tint(255, i*6);
image(img, i*10, 0, i*10, 400);

}




