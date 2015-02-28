
class Asteroide {
  
  int tam, posX, posY, level;
  float a;
  
  //Para dibujar asteroides diferentes
  int[] uno;
  int[] dos;
  int[] tres;
  int[] cuatro;
  int[] cinco;
  int[] seis;
  
  int rangeArea;
  
  Asteroide() {
    posX = (int)random(width);
    posY = -tam;
    a=0;
    
    uno = new int[2];
    dos = new int[2];
    tres = new int[2];
    cuatro = new int[2];
    cinco = new int[2];
    seis = new int[2];
    
    rangeArea = 5;
    
    //Hacer random para que haga asteroides diferentes
    uno[0]=(int) random (-rangeArea, rangeArea);
    uno[1]=(int) random (-rangeArea, rangeArea);
    
    dos[0]=(int) random (-rangeArea, rangeArea);
    dos[1]=(int) random (-rangeArea, rangeArea);
    
    tres[0]=(int) random (-rangeArea, rangeArea);
    tres[1]=(int) random (-rangeArea, rangeArea);
    
    cuatro[0]=(int) random (-rangeArea, rangeArea);
    cuatro[1]=(int) random (-rangeArea, rangeArea);
    
    cinco[0]=(int) random (-rangeArea, rangeArea);
    cinco[1]=(int) random (-rangeArea, rangeArea);
    
    seis[0]=(int) random (-rangeArea, rangeArea);
    seis[1]=(int) random (-rangeArea, rangeArea);
  }
  
  void crear(float v){
    dibujar(posX,posY);
    posY+=v;
  }
  
  void dibujar(int pX, int pY) {
    fill(0);
    
    pushMatrix();
      translate(posX, posY);
      rotate(a);
      
      //Asteroide cuadrado
      /*
      rect(1, 1, tam, tam);
      */
      
      //Asteroide aleatorio
      beginShape();
        vertex((1-(tam/2))+uno[0], (1-(tam/3))+uno[1]);
        vertex(1+dos[0], (1-(tam/2))+dos[1]);
        vertex((1+(tam/2))+tres[0], (1-(tam/3))+tres[1]);
        vertex((1+(tam/3))+cuatro[0], 1+cuatro[1]);
        vertex(1+cinco[0], (1+(tam/2))+cinco[1]);
        vertex((1-(tam/3))+seis[0], (1+(tam/4))+seis[1]);
      endShape(CLOSE);
    popMatrix();
    
    a+=(PI/270);
  }
  
  boolean out(){
    if (posY > height+tam) {
      return (true);
    } else {
      return (false);
    }
  }
  
  //Metodo que me devuelve un arreglo de la posX posY
  int[] getPos() {
    int[] posiciones = new int[2];
   
     posiciones[0] = posX;
     posiciones[1] = posY;
     
     return posiciones;
  }
  
  int getLevel() {
    return(level);
  }
  
  int getPoints() {
    return(tam);
  }
  
}

