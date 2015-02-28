
//variables
int r = 30; //radi
int numBoles = 100; //numero de boles

//matrius de poscicions
float[] X = new float[numBoles];
float[] Y = new float[numBoles];
float[] vX = new float[numBoles];
float[] vY = new float[numBoles];


void setup() {
  size(600, 600);
  stroke(255, 0, 0);
  fill(255);
  
  //posicions i velocitats
  for (int i = 0; i<numBoles; i++) {
    X[i] = 100;
    Y[i] = 20;
    vX[i] = random(4, 9);
    vY[i] = random(3, 8);
  }
}

void draw() {
  background(0);

  //actualitzacio posicions
  for (int i = 0; i<numBoles; i++) {
    X[i] = X[i] + vX[i];
    Y[i] = Y[i] + vY[i];

    //moviment

    //limits-posicio X
    if ((X[i]>width-r/2)||(X[i]<r/2)) {
      vX[i] = -vX[i];
    } 
    //limits-posicio Y
    if ((Y[i]>height-r/2)||(Y[i]<r/2)) {
      vY[i] = -vY[i];
    } 

    //boles
    ellipse(X[i], Y[i], r, r);
  }
}

