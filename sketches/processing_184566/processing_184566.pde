
float posicioX;
float posicioY;
float posicioX2;
float posicioY2;
float posicioX3;
float posicioY3;
float posicioXR;
float posicioYR;

float mida;
float midaR;

float velocitatX;
float velocitatY;
float velocitatX2;
float velocitatY2;
float velocitatX3;
float velocitatY3;
float velocitatXR;
float velocitatYR;

float bola1;
int bola2;
int bola3;

color Quadrat;
color Bola1;
color Bola2;
color Bola3;

float Augment;
float Reduccio;
float MinimMidaR;


void setup () {
  size (600, 400);

  posicioX = width/2;
  posicioY = height/2;
  posicioX2 = width/2;
  posicioY2 = height/2;
  posicioX3 = width/2;
  posicioY3 = height/2;
  posicioXR = width/2;
  posicioYR = height/2;

  mida = 20;
  midaR = 30;

  bola1 = 0;
  bola2 = 0;
  bola3 = 0;

  velocitatX = random (5);
  velocitatY = random (5);
  velocitatX2 = random (5);
  velocitatY2 = random (5);
  velocitatX3 = random (5);
  velocitatY3 = random (5);
  velocitatXR = 0;
  velocitatYR = 0;

  Quadrat = color(255, 255, 255);
  Bola1 = color(255, 255, 255);
  Bola2 = color(255, 255, 255);
  Bola3 = color(255, 255, 255);

  Augment = 10;
  Reduccio = -5;
  MinimMidaR = 10;
}

void draw () {
  background (0);

  rectMode (CENTER);


  //rebot quadrat

  if (posicioXR>width) {
    Quadrat = color (0, 0, 255);
    velocitatXR=-velocitatXR;
    if (midaR>MinimMidaR) {
      midaR=midaR + Reduccio;
    }
  } 

  if (posicioXR<0) {
    Quadrat = color (0, 255, 0);
    velocitatXR=-velocitatXR;
    if (midaR>MinimMidaR) {
      midaR=midaR + Reduccio;
    }
  } 

  if (posicioYR<0) {
    Quadrat = color (255, 0, 0);
    velocitatYR=-velocitatYR;
    if (midaR>MinimMidaR) {
      midaR=midaR + Reduccio;
    }
  }

  if (posicioYR>height) {
    Quadrat = color (255, 255, 255);
    velocitatYR=-velocitatYR;
    if (midaR>MinimMidaR) {
      midaR=midaR + Reduccio;
    }
  }

  //quadrat
  fill (Quadrat);
  posicioXR = posicioXR + velocitatXR;
  posicioYR = posicioYR + velocitatYR;
  rect (posicioXR, posicioYR, midaR, midaR);


  //bola1
  if (bola1>0) {

    posicioX = posicioX + velocitatX;
    posicioY = posicioY + velocitatY;


    if (posicioX+(mida/2) > width) {
      Bola1 = color (0, 0, 255);
      velocitatX = -velocitatX;
    }
    if (posicioX-(mida/2) < 0) {
      Bola1 = color (0, 255, 0);
      velocitatX = -velocitatX;
    }
    if (posicioY+(mida/2) > height) {
      Bola1 = color (255, 255, 255);
      velocitatY = -velocitatY;
    }
    if (posicioY-(mida/2) < 0) {
      Bola1 = color (255, 0, 0);
      velocitatY = -velocitatY;
    }
    fill (Bola1);
    ellipse (posicioX, posicioY, mida, mida);
  } else {
    bola1=bola1+1;
  }



  //bola2 a 10 segons

  if (bola2>600) {
    posicioX2 = posicioX2 + velocitatX2;
    posicioY2 = posicioY2 + velocitatY2;

    if (posicioX2+(mida/2) > width) {
      Bola2 = color (0, 0, 255);
      velocitatX2 = -velocitatX2;
    }
    if (posicioX2-(mida/2) < 0) {
      Bola2 = color (0, 255, 0);
      velocitatX2 = -velocitatX2;
    }
    if (posicioY2+(mida/2) > height) {
      Bola2 = color (255, 255, 255);
      velocitatY2 = -velocitatY2;
    }
    if (posicioY2-(mida/2) < 0) {
      Bola2 = color (255, 0, 0);
      velocitatY2 = -velocitatY2;
    }
    fill (Bola2);
    ellipse (posicioX2, posicioY2, mida, mida);
  } else {
    bola2=bola2+1;
  }

  //bola3 a 20 segons

  if (bola3>1200) {
    posicioX3 = posicioX3 + velocitatX3;
    posicioY3 = posicioY3 + velocitatY3;

    if (posicioX3+(mida/2) > width) {
      Bola3 = color (0, 0, 255);
      velocitatX3 = -velocitatX3;
    }
    if (posicioX3-(mida/2) < 0) {
      Bola3 = color (0, 255, 0);
      velocitatX3 = -velocitatX3;
    }
    if (posicioY3+(mida/2) > height) {
      Bola3 = color (255, 255, 255);
      velocitatY3 = -velocitatY3;
    }
    if (posicioY3-(mida/2) < 0) {
      Bola3 = color (255, 0, 0);
      velocitatY3 = -velocitatY3;
    }
    fill (Bola3);
    ellipse (posicioX3, posicioY3, mida, mida);
  } else {
    bola3=bola3+1;
  }
}



void mousePressed () {
  //bola1 desapareix
  if (mouseX>posicioX-mida/2 && mouseX<posicioX+mida/2) {
    if (mouseY>posicioY-mida/2 && mouseY<posicioY+mida/2) {
      if (Quadrat==Bola1) {
        midaR=midaR+Augment;
        bola1=-600;
      }
    }
  }
  //bola2 desapreix
  if (mouseX>posicioX2-mida/2 && mouseX<posicioX2+mida/2) {
    if (mouseY>posicioY2-mida/2 && mouseY<posicioY2+mida/2) {
      if (Quadrat==Bola2) {
        midaR=midaR+Augment;
        bola2=0;
      }
    }
  }

  //bola3 desapreix

  if (mouseX>posicioX3-mida/2 && mouseX<posicioX3+mida/2) {
    if (mouseY>posicioY3-mida/2 && mouseY<posicioY3+mida/2) {
      if (Quadrat==Bola3) {
        midaR=midaR+Augment;
        bola3=600;
      }
    }
  }

  //quadrat

  posicioXR = mouseX;
  posicioYR = mouseY;
}

void mouseReleased () {

  velocitatXR = mouseX - pmouseX;
  velocitatYR = mouseY - pmouseY;
}



