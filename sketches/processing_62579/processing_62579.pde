
class Explosion {

  int[] tipos= {
    1, 2, 3, 4, 5, 6, 7
  };
  int tipoActivo;
  float centroExplosionX, centroExplosionY;
  Particula[] metralla, metrallaaux;

  Explosion (float centroX, float centroY) {
    tipoActivo = tipos[(int)random(tipos.length)];
    centroExplosionX=centroX;
    centroExplosionY=centroY;
    metralla=new Particula[(int)random(10, 100)];
    for (int i = 0; i<metralla.length; i++) {
      metralla[i]=new Particula(tipoActivo, centroExplosionX, centroExplosionY);
    }
  }

  void dibuja() {
    for (int i = 0; i<metralla.length; i++) {
      metralla[i].dibuja();
    }
  }

  boolean estavacio() {
    if (metralla.length==0) return true;
    else return false;
  }

  void actualiza() {
    for (int i = 0; i<metralla.length; i++) {
      ////println("particula "+i+" en coordenadas x: "+metralla[i].posicionX+" e y: "+metralla[i].posicionY+" se va a desplazar x: "+metralla[i].velocidadX+" e y: "+metralla[i].velocidadY);
      metralla[i].desplaza();
      ////println("particula "+i+" se ha desplazado a x: "+metralla[i].posicionX+" e y: "+metralla[i].posicionY);
      if (metralla[i].estafuera()) {
        metralla[i]=metralla[metralla.length-1];
        metrallaaux=new Particula[metralla.length-1];
        arrayCopy(metralla, metrallaaux, metrallaaux.length);
        metralla=new Particula[metrallaaux.length];
        arrayCopy(metrallaaux, metralla);
      }
    }
  }
}

class Particula {

  float velocidadX, velocidadY;
  float posicionX, posicionY;
  int tipo;
  color relleno1, relleno2;
  float rotacion, velrotacion;
  float var1, var2;


  Particula (int temptipo, float tempposicionx, float tempposiciony) {
    tipo=temptipo;
    posicionX=tempposicionx;
    posicionY=tempposiciony;
    rotacion=random(2*PI);
    velrotacion=random(-0.1, 0.1);
    velocidadX=random(-10, 10)/5;
    velocidadY=random(-10, 10)/5;
    relleno1 = color(random(255), random(255), random(255));
    relleno2 = color(random(255), random(255), random(255));
    var1=random(4, 8);
    var2=random(8, 12);
  }

  void dibuja() {
    strokeWeight(1);
    stroke(relleno1);
    fill(relleno2);
    pushMatrix();
    translate(posicionX, posicionY);
    rotate(rotacion);
    switch(tipo) {
    case 1:
      ellipse (0, 0, var2, var2);
      break;
    case 2:
      triangle (0, 0, 0+var1, 0+var1, 0-var1, 0+var1);
      break;
    case 3:
      rect (0, 0, var2, var2);
      break;
    case 4:
      DibujaCorazon(0.08*var1);
      break;
    case 5:
      DibujaEstrella (var1, 6.0, (int)var2);
      break;
    case 6:
      DibujaFlor (0.05, 2*(int)var2);
      break;
    case 7:
      DibujaEspirales(0.1, 2*(int)var2);
      break;
    }
    popMatrix();
  }

  void desplaza() {
    posicionX+=velocidadX;
    posicionY+=velocidadY;
    rotacion+=velrotacion;
  }

  boolean estafuera() {
    if (posicionX<0 || posicionY<0 || posicionX>ancho || posicionY>alto) return true;
    else return false;
  }
}


class Pelota {

  float posicionX, posicionY;
  float velocidadX, velocidadY;
  int radio;
  color relleno;

  Pelota (float oriX, float oriY) {
    posicionX=oriX;
    posicionY = oriY;
    velocidadX= random(-3, 3);
    //velocidadX= velocidadX/abs(velocidadX);
    velocidadY= random (-3, 3);
    //velocidadY= velocidadY/abs(velocidadY);
    radio=5;
    relleno = color(random (255), random(255), random(255));
  }

  void dibuja() {
    fill(relleno);
    noStroke();
    ellipse(posicionX, posicionY, 2*radio, 2*radio);
  }

  void desplaza() {
    posicionX+=velocidadX;
    posicionY+=velocidadY;
    if (posicionX<0 || posicionX>ancho) velocidadX*=-1;
    if (posicionY<0 || posicionY>alto) velocidadY*=-1;
  }

  boolean cliked(float coordX, float coordY) {
    if (dist (coordX, coordY, posicionX, posicionY) <= radio) return true;
    else return false;
  }
}


