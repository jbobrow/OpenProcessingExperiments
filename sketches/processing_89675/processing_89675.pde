
class Bolinha {

  float x, y;
  float vx, vy;
  float alvox, alvoy;
  float tam, tamAtual;
  float alvoTam;

  Bolinha( float novoAlvoX, float novoAlvoY) {
    alvox = novoAlvoX;
    alvoy = novoAlvoY; 

    x = random (width);
    y = random (height);
    tam = random(3, 10);
    tamAtual = tam;
    alvoTam = tam;
  }

  void seleciona(float px, float py) {
    // se px, py tiver dentro do quadrado  aumenta o tamanho
    if ( px > x - tamAtual/2 && px < x + tamAtual/2 && py > y - tamAtual/2 && py < y + tamAtual/2 ) { 
      alvoTam = 10*tam;
    } 
    // senao diminui
    else {
      alvoTam = tam;
    }
  }

  void anda() {
    vx = (alvox-x)/50;
    vy = (alvoy-y)/50;
    x = x+vx;
    y = y+vy;
    tamAtual = tamAtual + (alvoTam - tamAtual)/10;
  }

  void desenha () {
   rectMode(CENTER); // altera a posição de x para o centro do rect
   // imageMode (CENTER);
    noStroke();
    fill (255, 255, 255, 50);
    stroke (50, 153, 204);
    strokeWeight (2);
    //   ellipse (x, y, tam, tam);
    
     // image (foto, x,y,tamAtual, tamAtual);
  ellipse (x, y, tamAtual, tamAtual);
  }

  void sorteiAlvo() {
    alvox= random (width);
    alvoy=random (height);
  }
}


