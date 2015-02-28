
class Automata {
  Celula[] celulas;

  Automata(float origenX, float origenY, int niveles, float tam) {
    ArrayList total = new ArrayList();
    Celula[][] grilla = new Celula[niveles][niveles];
    for (int y=0; y<niveles; y++) {
      boolean orientacion = false;
      float offsetX = y%2==0?tam/2:0;
      for (int x=y; x<niveles-y; x++) {
        grilla[x][y] = new Celula(origenX+x*tam/2, origenY+y*tam*hDeTri, tam, orientacion);
        total.add(grilla[x][y]);
        orientacion = !orientacion;
      }
    }

    /*//De 3
     for (int y=0; y<niveles; y++) { 
     for (int x=0; x<niveles; x++) {
     if (grilla[x][y]!=null) {
     if (x>0) grilla[x][y].vincular(grilla[x-1][y]);
     if (x<niveles-1) grilla[x][y].vincular(grilla[x+1][y]);
     if (grilla[x][y].orientacion) {
     if (y<niveles-1) grilla[x][y].vincular(grilla[x][y+1]);
     }
     else {
     if (y>0) grilla[x][y].vincular(grilla[x][y-1]);
     }
     }
     }*/
     //De 12
    for (int y=0; y<niveles; y++) { 
      for (int x=0; x<niveles; x++) {
        if (grilla[x][y]!=null) {
          if (x>0) grilla[x][y].vincular(grilla[x-1][y]);
          if (x<niveles-1) grilla[x][y].vincular(grilla[x+1][y]);
          if (x>1) grilla[x][y].vincular(grilla[x-2][y]);
          if (x<niveles-2) grilla[x][y].vincular(grilla[x+2][y]);
          if (y<niveles-1) {
            grilla[x][y].vincular(grilla[x][y+1]);
            if (x > 0) {
              grilla[x][y].vincular(grilla[x-1][y+1]);
              if (x > 1 && grilla[x][y].orientacion) grilla[x][y].vincular(grilla[x-2][y+1]);
            }
            if (x < niveles-1) {
              grilla[x][y].vincular(grilla[x+1][y+1]);
              if (x < niveles-2 && grilla[x][y].orientacion) grilla[x][y].vincular(grilla[x+2][y+1]);
            }
          }
          if (y>0) {
            grilla[x][y].vincular(grilla[x][y-1]);
            if (x > 0) {
              grilla[x][y].vincular(grilla[x-1][y+1]);
              if (x > 1 && grilla[x][y].orientacion) grilla[x][y].vincular(grilla[x-2][y+1]);
            }
            if (x < niveles-1) {
              grilla[x][y].vincular(grilla[x+1][y+1]);
              if (x < niveles-2 && grilla[x][y].orientacion) grilla[x][y].vincular(grilla[x+2][y+1]);
            }
          }
        }
      }
    }

    celulas = (Celula[])total.toArray(new Celula[0]);
  }

  void ciclar() {
    for (int i=0; i<celulas.length; i++) {
      celulas[i].calcularProximoEstado();
    }
    for (int i=0; i<celulas.length; i++) {
      celulas[i].actualizarEstado();
    }
  }

  void dibujar() {
    for (int i=0; i<celulas.length; i++) {
      noStroke();
      celulas[i].dibujar();
    }
    for (int i=0; i<celulas.length; i++) {
      if (celulas[i].encima()) {
        for (int j=0; j<celulas[i].vecinas.length; j++) {
          stroke(255, 255, 255);
          celulas[i].vecinas[j].dibujar();
          if (mousePressed) celulas[i].vecinas[j].estado = radians(frameCount);
        }
        stroke(180, 255, 255);
        celulas[i].dibujar();
          if (mousePressed) celulas[i].estado = radians(frameCount);
        break;
      }
    }
  }
}


