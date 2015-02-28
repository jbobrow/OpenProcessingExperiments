
size (250,250);
background (114);

fill (0,1);
stroke (25,12,245);
strokeWeight (3);
for (int r = 150; r <width; r+=5) {
rect (random (r), 1, r-40, r-10);
};
fill (255,10);
stroke (124,10,247);
strokeWeight (.5);
for (int r = 150; r <width; r+=1) {
rect (random (r), 1, r-40, r-10);
};
fill (245,152,30,10);
stroke (224,110,247);
strokeWeight (2);
for (int r = 150; r <width; r+=5) {
rect (random (r), 1, r-40, r-10);
};
smooth ();

stroke (252,252,25);
strokeWeight (.31);
for (int l = 2; l <width; l+=1) {
line (random (l), 100, l-40, l-10);
};
stroke (252,252,25);
strokeWeight (1);
for (int l = 2; l <width; l+=14) {
line (random (l), 100, l-40, l-10);
};
fill (255,5);
stroke (224,10,247);
strokeWeight (.2);
for (int r = 150; r <width; r+=10) {
rect (random (r), 1, r-40, r-10);
};

                
                
