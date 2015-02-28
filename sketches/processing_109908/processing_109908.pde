
void setup() {
  size(600, 400);
  frameRate(90);
}
int count = 0;
float[ ] YArray = new float[100];
float[ ] XArray = new float[100];
void draw() {

  /// Fill the arrays with random numbers
  for (int j=0;j<100;j++) {
    XArray[j] = random(600);
    YArray[j] = random(400);
  }

  //////Create Random ints
  
  ////////// Random Array int
  int randomint = floor(random(100));

  ////////// Random ellipse size int
  int sizeint = int(random(200));

  // Random color ints
  int REDint = floor(random(0, 255));
  int GREENint = floor(random(0, 255));
  int BLUEint = floor(random(0, 255));

  // Fil with random color after Count
  fill(REDint, GREENint, BLUEint);
  if (count == 5000) {
    background(BLUEint, GREENint, REDint);
    count = 0;
  }

  // Draw ellipse with random array and random size  
  ellipse(XArray[randomint], YArray[randomint], sizeint, sizeint);
  count = count + 1;
}



