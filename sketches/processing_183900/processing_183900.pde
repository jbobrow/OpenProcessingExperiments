

float mida = 40;

int total = 20;
float [] posicioX = new float [total];
float [] posicioY = new float [total];
float [] velocitatX = new float [total];
float [] velocitatY = new float [total];


void setup () {

  size(600, 400);

  //inicialització
  for (int i =0; i<total; i++) {
    posicioX[i] =  width/2;
    posicioY[i] =  height/2;
    velocitatX[i] = random (1, 3);
    velocitatY[i] = random (1, 3);
  }
}

void draw () {

  background(0);

  //actualització
  for (int i =0; i<total; i++) {
    posicioX[i] += velocitatX[i];
    posicioY[i] += velocitatY[i];

    //ull
    fill(255);
    ellipse (posicioX[i], posicioY[i], mida, mida);
    noStroke();
    fill(random (255), random (255), random (255));
    ellipse (posicioX[i], posicioY[i], mida/2+7, mida/2+7);
    fill(0);
    ellipse (posicioX[i], posicioY[i], mida/3, mida/3);

    posicioX[i]= posicioX[i] + velocitatX[i];
    posicioY[i]= posicioY[i]+ velocitatY[i];

    //rebot
    if (posicioX [i]>=width||posicioX[i]<=0) {
      velocitatX[i]=-velocitatX[i];
    }
    if (posicioY[i]>=height || posicioY[i]<=0) {
      velocitatY[i]=-velocitatY[i];
    }

    //rebotar per l'extrem
    if (posicioX[i]+mida/2>width||posicioX[i]-mida/2<=0) {
      velocitatX[i]=-velocitatX[i];
    }

    if (posicioY[i]+mida/2>height||posicioY[i]-mida/2<=0) {
      velocitatY[i]=-velocitatY[i];
    }
  }
}

  void mousePressed (){
  mida = random (30,70);
  
}
