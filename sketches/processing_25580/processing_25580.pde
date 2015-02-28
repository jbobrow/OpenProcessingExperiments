
size (250, 250);
background (30);
smooth ();

// circles
noStroke ();
fill (255, 10);
for (int iC = 20; iC <= width; iC+=10) {
  float w = random (iC) -100;
  float h = w;
  ellipse (random (iC), height / 2 - 50, w, h);
};

for (int iC = 20; iC <= width; iC+=10) {
  float w = random (iC) -100;
  float h = w;
  ellipse (random (iC), height / 2 + 50, w, h);
};
 
 
// beziers
noFill ();
strokeWeight(2);

stroke (#FFA420, 100);
for (int iB = 50; iB < 250; iB+=50) {
  bezier (0, width/2, 100, width/2-120, width/2-70, width/2+iB, width/2, width/2);
  bezier (width/2, width/2, width/2+70, width/2-iB/2, width-100, width/2, width, width/2);
};
stroke (#4189AB, 100);
for (int iB = 50; iB < 250; iB+=50) {
  bezier (0, width/2, 50, width/2-100, width/2, width/2+iB, width/2, width/2);
  bezier (width/2, width/2, width/2, width/2-iB/2, width-100, width/2, width, width/2);
};

stroke (#A3C439, 100);
for (int iB = 50; iB < 250; iB+=50) {
  bezier (0, width/2, 50, width/2-150, width/2-100, width/2+iB, width/2, width/2);
  bezier (width/2, width/2, width/2+100, width/2-iB/2, width-100, width/2, width, width/2);
};

