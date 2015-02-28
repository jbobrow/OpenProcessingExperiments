
PImage img1; 

int amount = 500;                      // amount of boids
int canvasX = 400;                     // canvas size x-direction
int canvasY = 300;                     // canvas size y-direction
float inc = 0.01;                     // move increasement every loop
float nX, nY;
 
float[] ptsX = new float[amount];      // declare + create array X
float[] ptsY = new float[amount];      // decalre + create array Y
 
void setup() {
  size(400, 300);
  smooth();
  img1 = loadImage("fly1.gif");
  background(255);
  for (int i = 0; i < amount; i++) {
    ptsX[i] = random(0, canvasX);      // write random starting pts to array X
    ptsY[i] = random(0, canvasY);      // write random starting pts to array Y
  }
}
 
void draw() {
  background (255);
  for (int i = 0; i < amount; i++) {
    nX = noise(ptsX[i]) * canvasX;     // add noise value to nX, based on array
    nY = noise(ptsY[i]) * canvasY;     // add noise value to nY, based on array
    image(img1, nX, nY, 11, 11);       // insert pt, based on noise value          
    ptsX[i] = ptsX[i] + inc;           // increase X with inc
    ptsY[i] = ptsY[i] + inc;           // increase Y with inc
  }
}

// adapted from 'fly'-boids (noise with array test)
// 09-11-14, Claus Rytter Bruun de Neergaard
 


