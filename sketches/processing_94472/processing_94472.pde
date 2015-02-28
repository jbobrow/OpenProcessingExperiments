
size (200, 200);
background (255);
PImage img;
img=loadImage("texct.jpg");
for (int i=0; i<170;     i=i+24) {
  for (int x=0; x<170;   x=x+24) {
    stroke (108, 166, 205);
    rect (i+4, x+4, 22, 22);
  }
}

image (img, 4, 4, 22, 22);
image (img, 28, 4, 22, 22);
image (img, 4, 28, 22, 22);
image (img, 172, 172, 22, 22);
image (img, 148, 172, 22, 22);
image (img, 172, 148, 22, 22);
image (img, 172, 4, 22, 22);
image (img, 172, 28, 22, 22);
image (img, 148, 4, 22, 22);
image (img, 4, 172, 22, 22);
image (img, 28, 172, 22, 22);
image (img, 4, 148, 22, 22);

image (img, 76, 76, 22, 22);
image (img, 100, 76, 22, 22);
image (img, 76, 100, 22, 22);
image (img, 100, 100, 22, 22);


