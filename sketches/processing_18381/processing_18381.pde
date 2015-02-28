
void setup () {
  size (250, 250);
  background (30);
  smooth ();
  frameRate (18);
};

void draw () {
  fill (30, 50);
  noStroke ();
  rect (0, 0, width, height);
 
  stroke (#E0D7BA, 100);
  for (int iLy = 0; iLy <= mouseY; iLy += 5) {
    line (10, random (iLy), width-10, random (iLy));
  };

  stroke (#A3C439, 100);
  for (int iLy = 0; iLy <= mouseY*1.2; iLy += 5) {
    line (50, random (iLy), width-50, random (iLy));
  };

  stroke (#FFA420, 100);
  for (int iLy = 0; iLy <= mouseY*1.4; iLy += 5) {
    line (70, random (iLy), width-70, random (iLy));
  };
  stroke (#4189AB, 100);
  for (int iLy = 0; iLy <= mouseY*1.6; iLy += 5) {
    line (150, random (iLy), width-150, random (iLy));
  };

};


