
/**
 * Additive Wave
 * by Daniel Shiffman.
 *
 * Create a more complex wave by adding two waves together.
 */

int particleCount = 1500;

float[] xs =  new float[particleCount];
float[] ys =  new float[particleCount];
float[] dxs = new float[particleCount];
float[] dys = new float[particleCount];

void setup() {
  size(500, 800);
  frameRate(50);
  background(0);
  noLoop();

  //colorMode(RGB, 255, 255, 255, 100);
  //smooth();

  noStroke();
  ellipseMode(CENTER);
  for (int i = 0; i < particleCount; i++) {
    resetParticle(i);
  }
}

void draw() {
  fill(0);
  rect(0,0, width, height);

  
  for (int i = 0; i < particleCount; i++) {
    
    if (xs[i] < 0 || xs[i] > width || ys[i] < 0 || ys[i] > height) {
       	resetParticle(i);
    }

    // gravity
    dys[i] += 0.2;
    dxs[i] *= 0.96;

    xs[i] += dxs[i];
    ys[i] += dys[i];

    fill( 255 - round(abs(dys[i]))*12 );
    ellipse(xs[i], ys[i], 4, 4);
  }

}


void resetParticle(int i) {
  xs[i] = width/2;
  ys[i] = height;
  dxs[i] = random(-10,10);
  dys[i] = random(-20, -10);
}

void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}

