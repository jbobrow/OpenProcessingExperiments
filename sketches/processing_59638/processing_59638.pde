
class Letra{
  char caracter;
  float x;
  float y;
  int corpo;
  Boolean start;
  Boolean cresce;

  Letra(char tempCaracter){
    caracter = tempCaracter;
    start = false;
    cresce = true;
    corpo = corpoMin;   
  }
  
  void definePosicao(float tempX, float tempY){
    x = tempX;
    y = tempY;
  }
  
  void escreve(){
    if(start){
      if(cresce){
        corpo++;
        if(corpo >= corpoMax){
          cresce = false;
        }
      }else{
        corpo--;
        if(corpo <= corpoMin){
          cresce = true;
          start = false;
        }
      }
    }

    textFont(fonte, corpo);
    text(caracter, x, y);
  }
}

