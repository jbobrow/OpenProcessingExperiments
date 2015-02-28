
class Quadrado{

  int banda;
  float tamanho;


  Quadrado(){
    banda = (int)random(0, 200);
    tamanho = 50;
  }

  void update(){
    //guarda-se o valor da banda deste quadrado
    float fftVal = fft.getBand(banda);

    //um valor minimo para o afastamento do quadrado à origem
    float raioMinimo = 25;

    //o valor para o qual vamos interpolar o nosso raio, baseado no valor de FFT
    float raioTarget = fftVal * 2;
  
    //definimos o valor de destino do tamanho, baseado no valor de FFT
    float tamanhoTarget = fftVal / 2;
    //se o valor de destino for maior que o tamanho actual, vamos assumir esse valor como o nosso valor de tamanho
    //para fazer uma animaçao brusca de aumento de tamanho sempre que o valor de FFT aumenta
    if(tamanho < tamanhoTarget){
      tamanho = tamanhoTarget; 
    } 
    //caso contrario, vamos diminuir o tamanho por uma pequena fracçao
    //para fazer uma animaçao suave de diminuir
    else {
      tamanho *= 0.95; 
    }

  }

  void desenhar(){
    //iniciamos uam nova transformaçao
    pushMatrix();
    
//desenha-se o quadrado centrado na origem
  // fill(255,0,0);
  // rect(-tamanho/2, -tamanho/2, tamanho, tamanho);

    image(p,-tamanho/2, -tamanho/2, tamanho, tamanho);
     
    //fechamos as nossas transformaçoes
    popMatrix();
  }
}



