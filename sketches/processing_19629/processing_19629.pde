
size (250, 250);
background (85);
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
 

