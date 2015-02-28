
//based on 1000 lines script by Barton Poulson
size(1200, 800);
background(255);
smooth();
stroke(100,25); //greyscale value and alpha transparency value

int n = 10000;
float[] xTop = new float[n];
float[] xBottom = new float[n];

//i equals index variable
for(int i = 0; i < n; i++) {
 xTop[i] = random(50,1150); 
  xBottom[i] = random(50,1150); //random values between 50 and 550
  line (xTop[i], 25, xBottom[i], 600);
  stroke( random(240,255), random(255), random(255), random (255));
}
