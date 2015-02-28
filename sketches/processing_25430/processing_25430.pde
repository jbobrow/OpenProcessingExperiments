
size (250, 250);
background (10,40);
smooth ();
stroke (245,172,25);
strokeWeight(1);
fill (245,172,25,14);
for (int C = 0; C <width; C+=10) {
ellipse (random (C), 200, C-20, C-20);
};
stroke (100,9,9);
strokeWeight (2);
for (int C = 0; C <width; C+=10) {
ellipse (random (C), 200, C-20, C-20);
};
stroke (100,9,9);
strokeWeight (2);
for (int C = 0; C <width; C+=5) {
ellipse (random (C), 10, C-100, C-10);
};
stroke (245,106,25);
strokeWeight (2.5);
for (int L = 10; L <width; L+=5) {
line (random (L), 1, L-100, L-10);
};
                
