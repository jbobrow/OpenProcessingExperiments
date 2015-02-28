
int[] pointsArrayX = new int[8];
int[] pointsArrayY = new int[8];
int a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p;

void setup() {
  size(640,480);
  frameRate(24);
  smooth();
}

void draw() {
  drawHandler();
  effects();
}

void drawHandler() {
  if (mousePressed==true) {
    mouseCapture();
    fillArray();
    drawPoints();
    drawLines();
    pointCloud();
  }
}

void drawPoints() {
  stroke(0);
  int strokeWeightNum = pointsArrayX.length;
  for (int i=0; i< pointsArrayX.length; i++) {
    strokeWeight(strokeWeightNum);
    point(pointsArrayX[i],pointsArrayY[i]);
    strokeWeightNum--;
  }
}

void drawLines() {
  stroke(0);
  int strokeWeightNum = pointsArrayX.length/2;
  for (int j = 0; j<pointsArrayX.length-1; j++) {
    strokeWeight(strokeWeightNum);
    line(pointsArrayX[j],pointsArrayY[j],pointsArrayX[j+1],pointsArrayY[j+1]);
    if (strokeWeightNum > 1) {
      strokeWeightNum--;
    }
  }
}

void pointCloud() {
  stroke(100);
  int a=mouseX;
  int b=mouseY;
  int spread=0;
  for (int i = 0; i<100; i++) {
    point(a,b);

    a += int(random(spread));
    a -= int(random(spread));
    b += int(random(spread));
    b -= int(random(spread));
    if (spread<5){
      spread++;
    }

  }
}

void mouseCapture() {
  a = mouseX;
  b = mouseY;
  c = pmouseX;
  d = pmouseY;
  e = c + int(random(1)) - int(random(1));
  f = d + int(random(1)) - int(random(1));
  g = e + int(random(2)) - int(random(2));
  h = f + int(random(2)) - int(random(2));
  i = g + int(random(4)) - int(random(4));
  j = h + int(random(4)) - int(random(4));
  k = i + int(random(8)) - int(random(8));
  l = j + int(random(8)) - int(random(8));
  m = k + int(random(16)) - int(random(16));
  n = l + int(random(16)) - int(random(16));
  o = m + int(random(32)) - int(random(32));
  p = n + int(random(32)) - int(random(32));
}

void fillArray() {
  pointsArrayX[0] = a;
  pointsArrayX[1] = c;
  pointsArrayX[2] = e;
  pointsArrayX[3] = g;
  pointsArrayX[4] = i;
  pointsArrayX[5] = k;
  pointsArrayX[6] = m;
  pointsArrayX[7] = o;
  pointsArrayY[0] = b;
  pointsArrayY[1] = d;
  pointsArrayY[2] = f;
  pointsArrayY[3] = h;
  pointsArrayY[4] = j;
  pointsArrayY[5] = l;
  pointsArrayY[6] = n;
  pointsArrayY[7] = p;
}

//--
float v = 1.0/9.0;  //original float v = 1.0/9.0;
float[][] kernel = {  
  {
    v*-1.1, v*-0.9, v                }
  , {
    v, v, v                }
  , {
    v, v*5, v                }  
};
PImage img = createImage(width, height, RGB);
//--
void effects() {
  img = get(0,0,width,height);
  img.loadPixels();

  //.....begin effects.............

  for (int y = 1; y < img.height-1; y++) { // Skip top and bottom edges
    for (int x = 1; x < img.width-1; x++) { // Skip left and right edges
      float sum = 1; // Kernel sum for this pixel
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky)*width + (x + kx);
          // Image is grayscale, red/green/blue are identical
          float val = red(img.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          sum += (kernel[ky+1][kx+1] * val);
        }
      }
      // For this pixel in the new image, set the gray value
      // based on the sum from the kernel
      img.pixels[y*img.width + x] = color(sum);
    }
  }
  // State that there are changes to img.pixels[]

  img.updatePixels();
  image(img, 0, 0); // Draw the new image
  //.....end effects.............
}








