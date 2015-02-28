
size (250, 250);
background (30);
smooth ();

// circles
noStroke ();
fill (255, 10);
for (int iC = 0; iC <= width; iC+=10) {
  ellipse (random(iC), height / 2, iC-100, iC-100);
};

// beziers
noFill ();
stroke (#A3C439, 100);
strokeWeight(2);
for (int iB = 0; iB < 150; iB+=15) {
  bezier (0, height / 2, iB, (height / 2) + iB, iB, (height / 2) - iB, 250, height / 2);
};

stroke (#F22E3E, 100);
for (int iB = 0; iB < 150; iB+=20) {
  bezier (0, height / 2, iB-50, (height / 2) + (iB / 2), iB, (height / 2) - iB, 250, height / 2);
};
stroke (#C98127, 100);
for (int iB = 0; iB < 150; iB+=20) {
  bezier (0, height / 2, iB + 50, (height / 2) - (iB / 2), iB, (height / 2) + iB, 250, height / 2);
};
stroke (#B3E3FC, 50);
for (int iB = 0; iB < 150; iB+=15) {
  bezier (0, height / 2, iB + 30, (height / 2) - iB, iB - 100, (height / 2) + iB, 250, height / 2);
};



