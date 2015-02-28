
size (250, 250);
background (30);
smooth ();
 
// circles
noStroke ();
fill (255, 10);
for (int iC = 0; iC <= width; iC += 30) {
  ellipse (iC, (height / 2) + (iC/2), iC + 20, iC + 20);
  ellipse (iC, (height / 2) - (iC/2), iC + 20, iC + 20);
};

// lines
stroke (#BF372A, 100);
strokeWeight(3);
for (int iL = 0; iL < height; iL+=15) {
  line (0, height / 2, width, iL);
};

// beziers
noFill ();
strokeWeight(2);
stroke (#4189AB, 150);
for (int iB = 0; iB < 150; iB+=15) {
  bezier (-20, height / 2, iB, (height / 2) + iB, iB, (height / 2) - iB, width+20, height / 2);
};
stroke (#4189AB, 150);
for (int iB = 0; iB < 150; iB+=20) {
  bezier (-20, height / 2, iB + 50, (height / 2) - iB, iB, (height / 2) + iB, width+20, height / 2);
};
stroke (#FBD269, 100);
for (int iB = 0; iB < 150; iB+=20) {
  bezier (0, height / 2, iB - 50, (height / 2) + iB, iB, (height / 2) - iB, width+20, height / 2 -70);
};
stroke (#FBD269, 100);
for (int iB = 0; iB < 150; iB+=15) {
  bezier (0, height / 2, iB + 30, (height / 2) - iB, iB - 100, (height / 2) + iB, width+20, height / 2 -70);
};

stroke (#87A244, 100);
for (int iB = 0; iB < 150; iB+=20) {
  bezier (20, height / 2, iB - 50, (height / 2) + iB, iB, (height / 2) - iB, width+20, height / 2 +70);
};
stroke (#87A244, 100);
for (int iB = 0; iB < 150; iB+=15) {
  bezier (20, height / 2, iB + 30, (height / 2) - iB, iB - 100, (height / 2) + iB, width+20, height / 2 +70);
};



