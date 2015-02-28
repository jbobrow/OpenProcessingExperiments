
//variables
int numBoles = 100; //numero de boles

//matrius de poscicions
float[] X = new float[numBoles];
float[] Y = new float[numBoles];
float[] vX = new float[numBoles];
float[] vY = new float[numBoles];
float[] r = new float[numBoles];
float[] colorR= new float[numBoles];
float[] colorG= new float[numBoles];
float[] colorB= new float[numBoles];


void setup() {
  size(600, 600);
  noStroke();

  //posicions, velocitats i colors
  for (int i = 0; i<numBoles; i++) {
    X[i]=random(0,width-r[i]-1);
    Y[i]=random(0,height-r[i]-1);
    vX[i]=random(4,9);
    vY[i]=random(3,8);
    r[i]=random(1,40);
    colorR[i]=random(245);
    colorG[i]=random(189);
    colorB[i]=random(214);
  }
}

void draw() {
  background(255);
  
  //actualitzacio posicions
  for (int i = 0; i<numBoles; i++) {
    X[i] = X[i] + vX[i];
    Y[i] = Y[i] + vY[i];

    //moviment

    //limits-posicio X
    if ((X[i]>width-r[i]/2)||(X[i]<r[i]/2)) {
      vX[i] = -vX[i];
    } 
    //limits-posicio Y
    if ((Y[i]>height-r[i]/2)||(Y[i]<r[i]/2)) {
      vY[i] = -vY[i];
    } 

    //boles
    fill(colorR[i], colorG[i], colorB[i]);
    ellipse(X[i], Y[i], r[i], r[i]);
  }
}
