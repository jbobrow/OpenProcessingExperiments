
/* @pjs preload = "pumpkins.jpg" ' */
size (200, 100);
PImage pumpkins;
pumpkins = loadImage ("pumpkins.jpg");
image (pumpkins, 0, 0);
PImage crop = get ();
tint (200);
image (crop, 10, 10);
tint (150);
image (crop, 20, 20);
tint (100);
image (crop, 30, 30);
tint (50);
image (crop, 50, 50);
tint (100);
image (crop, 60, 60);
tint (150);
image (crop, 70, 70);
tint (200);
image (crop, 80, 80);









