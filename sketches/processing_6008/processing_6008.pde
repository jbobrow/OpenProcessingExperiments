
// network studies (perlin noise + array) v2
// written 09-11-15, Claus Rytter Bruun de Neergaard

int boids = 100;                           // amount of boids
int canvasX = 700;                        // canvas size x-direction
int canvasY = 700;                         // canvas size y-direction
float inc = 0.002;                         // move increasement every loop

float[] ptsX = new float[boids];           // declare + create array X
float[] ptsY = new float[boids];           // declare + create array Y
float[] posX = new float[boids];           // declare + create array X
float[] posY = new float[boids];           // declare + create array Y

void setup() {
  size(canvasX, canvasY);
  smooth();
  stroke(0, 170, 250);
  strokeWeight(1);
  background(255);
  ellipseMode(CENTER);

  for (int i = 0; i < boids; i++) {
    ptsX[i] = random(0, canvasX);          // write start pts to arrayX
    ptsY[i] = random(0, canvasY);          // write start pts to arrayY
    posX[i] = ptsX[i];                     // write update positions to arrayX
    posY[i] = ptsY[i];                     // write update positions to arrayY
  }
}

void draw() {
  background(0);
  fill(255); 
  stroke(255, 100);
  strokeWeight(1);  

  // Update the boids' positions
  for (int i = 0; i < boids; i++) {
    posX[i] = noise(ptsX[i]) * canvasX;    // update the screen position
    posY[i] = noise(ptsY[i]) * canvasY;    // update the screen position
    ptsX[i] = ptsX[i] + inc;               // update position in perlin noise space
    ptsY[i] = ptsY[i] + inc;               // update position in perlin noise space
  }

  // draw the connecting lines
  for (int i = 0; i < boids-1; i++) { 
    for (int j = i; j < boids; j++) {
      if (dist(posX[j], posY[j], posX[i], posY[i]) < 50) {
        line(posX[j], posY[j], posX[i], posY[i]);
      }
    }
  }
  
  // draw the boids (draw them last, so they are not masked by lines)
  for (int i = 0; i < boids; i++) {
    ellipse(posX[i], posY[i], 4, 4);       // insert ellipse or pts
  }
}

