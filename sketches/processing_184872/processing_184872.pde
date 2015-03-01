
float mida = 40;
float fillG = 33;


int totalBoles = 50;
float [] posicioX = new float [totalBoles];
float [] posicioY = new float [totalBoles];
float [] velocitatX = new float [totalBoles];
float [] velocitatY = new float [totalBoles];

void setup () {
  size (600, 400);
  
  for (int i =0; i<totalBoles; i++) {
    posicioX[i] =  width/2;
    posicioY[i] =  height/2;
    velocitatX[i] = random (1,2);
    velocitatY[i] = random (1,2);
  }
}


void draw () {
  
  background (255,162,162);
  stroke (216, fillG, random (255), random (255));
  fill (216, fillG, random (255), random (255));
  
    for (int i = 0; i<totalBoles; i++) {
    posicioX[i] += velocitatX[i];
    posicioY[i] += velocitatY[i];
    
 
  //pilota
  ellipse (posicioX[i], posicioY[i], mida, mida);
  posicioY[i] = posicioY[i] + velocitatY[i];
  posicioX[i] = posicioX[i] + velocitatX[i];
  
  //rebot dalt i baix
  
    if (posicioY[i] + mida/2 >= height|| posicioY[i] - mida/2 <= 0) {
    velocitatY[i]= -velocitatY[i];
  }
      if (posicioX[i] + mida/2 >= width|| posicioX[i] - mida/2 <= 0) {
    velocitatX[i]= -velocitatX[i];
  }
    }
    
}

  void mousePressed (){
  mida = random (10,50);
  fillG = random (150);

}




 
 
  
  
  
