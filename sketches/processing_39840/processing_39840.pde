
//Com_Methods_H.W. 6_ array

int num = 20; // variables

float[] P = new float [num];  // X axis
float[] J = new float [num];  // Y axis
float[] A = new float [num];  // Speed 

void setup () {
  size (400, 400);
  smooth();
  rectMode (CENTER);

  for (int a = 0; a < num; a++) {
    P[a] = random (width);
    J[a] = random (height/4);
    A[a] = 0.5;
  }
}


void draw () {

  background (0);
  stroke (1);  

  for (int a = 0; a < P.length; a++) {
    fill (100, 100, 30, 150);
    rect (P[a], J[a], 10, 10);                          // 1st rectangle size 

    pushMatrix();
   
    translate (0, height/4);                            //moving origin
    fill (200, 100, 30, 100);                            // 2nd rectangle size
    rect (P[a], J[a], 30, 30);

    translate (0, 2*height/4);                          //moving origin
    fill (200, 200, 30, 150);
    rect (P[a], J[a], 15, 15);                          // 3rd rectangle size

    popMatrix();

    P[a] = P[a] + A[a];                                 //controling speed 

    if (P[a] > height) {
      P[a] = -10;
    }
  }
}


