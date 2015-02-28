
// 'fly'-boids (noise with array test)
// written 09-11-14, Claus Rytter Bruun de Neergaard

int amount = 200;                      // amount of boids
int canvasX = 800;                     // canvas size x-direction
int canvasY = 600;                     // canvas size y-direction
float inc = 0.003;                     // move increasement every loop
float nX, nY;

float[] ptsX = new float[amount];      // declare + create array X
float[] ptsY = new float[amount];      // decalre + create array Y

void setup() {
  size(canvasX, canvasY);
  smooth();
  strokeWeight(3);
  background(255);
  for (int i = 0; i < amount; i++) {
    ptsX[i] = random(0, canvasX);      // write random starting pts to array X
    ptsY[i] = random(0, canvasY);      // write random starting pts to array Y
  }
}

void draw() {
  fill(255, 200);
  rect(-2, -2, canvasX+4, canvasY+4);
  for (int i = 0; i < amount; i++) {
    nX = noise(ptsX[i]) * canvasX;     // add noise value to nX, based on array
    nY = noise(ptsY[i]) * canvasY;     // add noise value to nY, based on array
    point(nX, nY);                     // insert pt, based on noise value
    ptsX[i] = ptsX[i] + inc;           // increase X with inc
    ptsY[i] = ptsY[i] + inc;           // increase Y with inc 
  }
}


