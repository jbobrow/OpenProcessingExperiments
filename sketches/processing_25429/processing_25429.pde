
size (250,250);
background (214,272,139);
stroke (228,219,23);
smooth ();
strokeWeight (10);
bezier (250,170,175,170,170,220,0,195);
strokeWeight (15);
bezier (250,170,175,170,170,220,0,195);
strokeWeight (30);
bezier (250,170,175,170,170,220,0,195);
strokeWeight (10);
bezier (250,170,175,170,170,220,0,195);
stroke (228,219,23);
smooth ();
strokeWeight (15);
bezier (195,0,220,170,170,175,170,250);
stroke (200);
strokeWeight (2);
for (int l = 10; l< height; l+=20) {
line (random (l), 200, l-20,l-10);
};
