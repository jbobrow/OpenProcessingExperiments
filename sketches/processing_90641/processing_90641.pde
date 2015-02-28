
size (400, 400);
PImage img;
img = loadImage("board.jpg");

image(img, 0, 0);

for (int i=0; i< 20; i++) {  
  PImage crop = get (i*10, i*10, 100, 100);
  image(crop, random(width), random(height), 100, 100);
}


