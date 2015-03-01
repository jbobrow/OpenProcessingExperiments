
int numCells = 100;
int scrWidth = 600;
int scrHeight = 600;
int cellSize = 5;

float gradientSensSmoothing = 10;
float gradientTumbleReset = 1.1; 

float nutrientGradient = 0.7;

float x[] = new float [numCells];
float y[] = new float [numCells];
float concentration[] = new float [numCells];
float lastConcentration[] = new float[numCells];
float gradient[] = new float [numCells];
float angle[] = new float [numCells];
PImage env;

void setup() {  
  size(600, 600);
  background(0);  
  
  for (int i  = 0; i < numCells; i ++ ) {
      x[i] = (int)random(scrWidth);
      y[i] = (int)random(scrHeight);
      angle[i] = random(2.0*PI);
  }
  
  env = createImage(scrWidth, scrHeight, RGB);
  env.loadPixels();
  int col;
  for (int i = 0; i < env.width; i++) {
       for (int j = 0; j < env.height; j++) {
         col=300-(int)(nutrientGradient*dist(i,j,scrWidth/2,scrHeight/2));
        env.pixels[i+j*env.width] = color(col, 0, col/2); 
      }
  }
  env.updatePixels();
  image(env, 0, 0);
  
  for (int i  = 0; i < numCells; i ++ ) {
      lastConcentration[i] = env.get((int)x[i],(int)y[i]);
      concentration[i] = env.get((int)x[i],(int)y[i]);
  }
}

void draw() {  

  for (int i  = 0; i < numCells; i ++ ) {
      if(gradient[i] < 0) tumble(i);
      else run (i,0.7);  
  }
  
  background(0);
  drawEnvironment();
  drawCells();  
  getConcentrationsAndGradients();
}

void run (int n, float d) {
    x[n] = x[n] + d*sin(angle[n]);
    y[n] = y[n] + d*cos(angle[n]);
    if (x[n] > scrWidth) x[n] = 0;
    if (y[n] > scrHeight) y[n] = 0;
    if (x[n] < 0) x[n] = scrWidth;
    if (y[n] < 0) y[n] = scrHeight;
}

void tumble (int n ) {
    angle[n] = random(2.0*PI);
    gradient[n] = gradientTumbleReset;
}

void drawCells() {
    fill(255,255,255);
    for (int i = 0 ; i < numCells; i++) {
        ellipse(x[i],y[i],cellSize, cellSize);
    }
}

void drawEnvironment(){
   image(env, 0, 0);     
}

void getConcentrationsAndGradients() {
    for (int i = 0 ; i < numCells; i++) {
        lastConcentration[i] = concentration[i];
        concentration[i] = red(env.get((int)x[i],(int)y[i]));
        gradient[i] += (concentration[i] - lastConcentration[i] - gradient[i])/gradientSensSmoothing;        
    }
}

