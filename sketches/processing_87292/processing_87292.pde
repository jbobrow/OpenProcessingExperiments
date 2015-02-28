
int n=250;

float[] angX=new float[n];
float[] angY=new float[n];
float[] angZ=new float[n];
float[] X=new float[n];
float[] Y=new float[n];
float[] Z=new float[n];
float[] b=new float[n];
int[] x = { 
  11, 23, 55, 90
};



void setup() 
{
  //frameRate(20);
  size(500, 500, P3D);

  for (int i=0;i<n;i++) 
  {
    X[i]=random(width);
    Y[i]=random(-1200, -500);
    //Y[i]=random(800, 1200);
    Z[i]=random(-1000, 1000);
    b[i]=random(3, 10);

    angX[i]=noise(0.5);
    angY[i]=noise(0.5);
  }
}

void draw() {
  //for (int j=0;j<4;j++) 
  background(0);
  ambientLight(random(1, 10)*25.5, random(1, 10)*25.5, random(1, 10)*25.5);


  // lights();
  noStroke();
  for (int i=0;i<n;i++) {
    pushMatrix();

    translate(X[i], Y[i], Z[i]);
    rotateX(angX[i]);
    rotateY(angY[i]);
    box(b[i]);

    Y[i]+=random(0.3, 3);
    X[i]+=random(-3, 3);
    Z[i]+=random(-3, 3);


    angX[i]+=noise(0.1);
    angY[i]+=noise(0.1);
    angZ[i]+=noise(0.1);
    popMatrix();
  }
}



