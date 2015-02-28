
class Bola{

  float posicaoX;
  float posicaoY;

  float velocidadeX;
  float velocidadeY;

  float aceleracaoX;
  float aceleracaoY;

  float raio;

  float resistencia;

  float anteriorX;
  float anteriorY;
  
  int banda;



  Bola(){
    posicaoX = random(0, 400);
    posicaoY = random(0, 300);

    anteriorX = posicaoX;
    anteriorY = posicaoY;

    raio = 25;

    resistencia = 0.90;
    
    banda = (int)random(0, 256);
  } 


  void mover(){

    velocidadeX += aceleracaoX;
    velocidadeY += aceleracaoY;

    velocidadeX *= resistencia;
    velocidadeY *= resistencia;

    posicaoX += velocidadeX;
    posicaoY += velocidadeY;

    aceleracaoX = 0;
    aceleracaoY = 0;

  }


  void forca(float forcaX, float forcaY){
    aceleracaoX += forcaX;
    aceleracaoY += forcaY;
  }

  void elastico(float destinoX, float destinoY, float divisao){
    aceleracaoX += (destinoX - posicaoX) / divisao;
    aceleracaoY += (destinoY - posicaoY) / divisao;
  }

  void atraccao(float destinoX, float destinoY, float forca){
    float distX = destinoX - posicaoX;
    float distY = destinoY - posicaoY;

    float distancia = dist(destinoX, destinoY, posicaoX, posicaoY);

    if(distancia < 1.0){
      distancia = 1.0; 
    }

    distX /= distancia;
    distY /= distancia;

    float forcaX = distX * (forca / distancia);
    float forcaY = distY * (forca / distancia);

    aceleracaoX += forcaX;
    aceleracaoY += forcaY;
  }

  void repulsa(float destinoX, float destinoY, float forca){
      float distX = destinoX - posicaoX;
    float distY = destinoY - posicaoY;

    float distancia = dist(destinoX, destinoY, posicaoX, posicaoY);

    if(distancia < 1.0){
      distancia = 1.0; 
    }

    distX /= distancia;
    distY /= distancia;

    float forcaX = distX * (forca / distancia);
    float forcaY = distY * (forca / distancia);

    aceleracaoX -= forcaX;
    aceleracaoY -= forcaY;
  }


  void colisao(){
    if(posicaoX < raio){
      posicaoX = raio;
      // velocidadeX = -velocidadeX;
      velocidadeX *= -1;
    }
    if(posicaoX > width - raio){
      posicaoX = width - raio;
      velocidadeX *= -1;

    }
    if(posicaoY < raio){
      posicaoY = raio;
      velocidadeY *= -1;
    }
    if(posicaoY > height - raio){
      posicaoY = height- raio;
      velocidadeY *= -1;
    } 
  }


  void desenhar(){
    /*stroke(255);
    line(anteriorX, anteriorY, posicaoX, posicaoY);

    anteriorX = posicaoX;
    anteriorY = posicaoY;*/
    
    image( imagemparticula, posicaoX, posicaoY, raio, raio);
    
  }


}







