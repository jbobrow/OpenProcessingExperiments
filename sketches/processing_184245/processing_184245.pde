
float mida = 20;
int boles= 400;
float [] posicioX = new float [boles];
float [] posicioY = new float [boles];
float [] velocitatX = new float [boles];
float [] velocitatY = new float [boles];
PImage bombilla;

void setup () {
  size (570, 520);
  bombilla= loadImage ("bombilla.jpg");

  //INICIALITZEM
  for (int i=0; i<boles; i++) {
    posicioX[i] = width/2;
    posicioY[i] = height/2;
    velocitatX[i] = random (1, 2); 
    velocitatY[i] = random (1, 2);
  }
}

void draw () {
  background(0);
  image (bombilla, 0, 0);
  bombilla.resize(0, 519);

  //CREEM BUCLE
  for (int i = 0; i < boles; i++) {
    //ACTUALITZEM 
    posicioX[i] = posicioX[i] += velocitatX[i];
    posicioY[i] = posicioY[i] += velocitatY[i];

    //COMPROBEM LÍMITS
    if (posicioX [i] < 100 || posicioX [i] > width-185) {
      velocitatX [i] = -velocitatX [i];
    }

    if (posicioY [i] < 60 || posicioY[i] > height-80) {
      velocitatY [i]= -velocitatY [i];
    }


    stroke (random (255));
    strokeWeight (2);
    ellipse (posicioX[i], posicioY[i], mida/2, mida/2);
    
  }
  }
void mousePressed() {
  fill (random (0), random (0)); 
  for (int i= 0; i < boles; i++) {
  velocitatX [i] = random (-2, 2);
  velocitatY [i] = random (-2, 2);
  mida = random (25);
  }
  
  
  
  
  
}


