


float [] theta;
int res;

void setup() {
  size(400, 450);
  background(255);

  // Resolution of sine and cosine
  res = 60;
  theta   = new float[res];
  // Precomputed angles
  for (int i=0; i<res; i++) {
    theta[i] = map(i, 0, res, 0, 2*PI);
  }
}

void draw() {
  background(255);
  
  for (int i=0; i < 20; i++) {
    for (int j=0; j < 20; j++) {
      // Each circle has it's own different initial phase.
      lcircle(100+i*10, 10+j*10, theta[frameCount%res]+(i+20*j)); 
      hcircle(100+i*10, 250+j*10, theta[frameCount%res]+(i+20*j));
    }
  }
}


void hcircle(int posx, int posy, float theta) {
  // Just the moving part.
  fill(0);
  ellipse(posx+sqrt(10)*cos(theta), posy+sqrt(10)*sin(theta), 2, 2);
}

void lcircle(int posx, int posy, float theta) {
  fill(255);
  ellipse(posx, posy, 10, 10);
  fill(0);
  ellipse(posx+sqrt(10)*cos(theta), posy+sqrt(10)*sin(theta), 2, 2);
}



