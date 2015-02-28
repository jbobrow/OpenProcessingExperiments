
float limiteH;

void setup () {//comando para defenir as propriedades do ambiente inicial, tais como tamalho da janela, cor de fundo, carregar imagemm, etc. antes de começar a executar 

  frameRate(6);// especifica o número de frames a serem exibidos a cada segundo.
  size (600, 600); // comando para defenir o tamaho da janela  em pixeis, primeiro parametro é a largura e o segundo é altura
  smooth(); // suaviza a imagem, melhora a qualidade de imagens redimensionadas 
  //noLoop(); // para o processo que continua a executar o codigo dentro do draw(), deve ser a ultima linha de codigo dentro do setup().
}

void draw() { // comando para executar 

  background (100, random (200,255), 0);//random permite-me escolher uma cor aleatoria, neste caso as cores r, g, b, são escolhidas aleatoriamente.


  for (int i = 0; i < 600; i = i+10) {// cria um ciclo que vai de 0 a 600, incrementando de 10 em 10 no eixo x

    limiteH = random(400); // limiteH são valores aleatoios até 200

    if (limiteH < 250) {// se o limeteH for inferior a 150 a linha fica com a cor e tranparencia que estão a seguir ...
      stroke (100, random (200,255), 0); // cor da linha e transparencia
    }
    else {//...se não fica com esta  
      stroke (0, random (0,200), 10); // cor da linha e transparencia
    }
    strokeWeight(11);// espessura da linha 
    line(i, limiteH, i, 600); // uma linha com primeira cordenada em 0 a 600 e valores aleatórios ate 400 no eixo y
  }
} 

