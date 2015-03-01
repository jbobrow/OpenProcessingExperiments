
class Esfera {

  void mostrar(float s) {
    for (int i = 0; i< s; i++) {
      fill(#DF928E,120);
      noStroke();
      ellipse(posX[i], posY[i], sz[i], sz[i]);
    }
  }

  void posicion(float m,float s) {
    float limite= m;

    for (int i = 0; i< s; i++) {
      // velocidad
      posX[i] = posX[i] + vx[i];
      posY[i] = posY[i] + vy[i];
      } // for
    }
    
    void acciones(float m, float s){
    float limite= m;
    float friccion = 0.95;
    for (int i = 0; i< s; i++) {
    //rebote
      if (posX[i] > width-sz[i]/2 || posX[i] < 0+sz[i]/2) {
        vx[i] = -vx[i];
        vy[i] = vy[i] * friccion;
      } 
      if (posY[i] > height-sz[i]/2 || posY[i] < limite+sz[i]/2+3) {
        vy[i] = -vy[i];
        vy[i] = vy[i] * friccion;
      }

      // ratón
      if (mousePressed == true && mouseY > limite+5) {
        float distanciaX = mouseX - posX[i];
        float distanciaY = mouseY - posY[i];

        posX[i] = posX[i] + distanciaX*0.05; 
        posY[i] = posY[i] + distanciaY*0.05;
      }
    }// for
      
    }
    void gravedad(float s) {
      for (int i = 0; i< s; i++) {
        vy[i] += 0.02;
      }
    }
  }


