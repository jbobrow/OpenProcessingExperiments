
void setup () {//comando para defenir as propriedades do ambiente inicial, tais como tamalho da janela, cor de fundo, carregar imagemm, etc. antes de começar a executar 

  frameRate(10);// especifica o número de frames a serem exibidos a cada segundo.
  size (500, 500); // comando para defenir o tamaho da janela  em pixeis, primeiro parametro é a largura e o segundo é altura
  smooth(); // suaviza a imagem, melhora a qualidade de imagens redimensionadas 
  //noLoop(); /* para o processo que continua a executar o codigo dentro do draw(), deve ser a ultima linha de codigo dentro do setup(). 
}

void draw() { // comando para executar 

  background (0, 159, 0);//random permite-me escolher uma cor aleatoria, neste caso as cores r, g, b, são escolhidas aleatoriamente.


  for (int i = 0; i < 600; i = i+10) {// cria um ciclo que vai de 0 a 600, incrementando de 10 em 10 no eixo x

    stroke (0, 0, 255,50); // cor da linha e transparencia 
    strokeWeight(11);// espessura da linha 
    line(i, random (400), i, 600); // uma linha com primeira cordenada em 0 a 600 e valores aleatórios ate 400 no eixo y 
  }


    for (int x = 1; x < 10; x = x+1) { // mais um ciclo 

    noStroke();// sem contorno 
    fill(0, 159, 0,200); // cor da elipse e transparencia 
    ellipse( x * 50, width/2, 60, 60);// elipses verdes 
  }


  for (int x = 1; x < 20; x = x+2) { // mais um ciclo que comeca em 1  e vai até 20, incrementando de 2 em 2

    fill(0, 0,255); // prenchimento da elipse  
    ellipse( x * 25, width/2, 35, 35); // elipses azuis 
  }
}

