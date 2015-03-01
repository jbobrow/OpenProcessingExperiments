
int h1, h2, m1, m2, s1, s2; //Variáveis que receberão os valores das dezenas e unidades das horas, minutos e segundos do tempo fornecido pelo sistema.
PImage imgSecond, imgSecond2, imgMinute, imgMinute2, imgHour, imgHour2; //Variáveis que receberão as diferentes imagens referentes a cada um dos números dependendo dos valores recebidos pelas variáveis acima.

void setup() {
  size(318, 64); //A imagem de cada número tem 64 de altura e 53 de largura. Como precisamos de 6 números para mostrar horas, minutos e segundos (hhmmss), a largura deve ser de 6x53, ou seja, 318.
}

void draw() {
  relogio(); //Chama a função relógio
  image(imgSecond, 212, 0); //As funções image() posicionam a imagem armazenada na variável do primeiro elemento dentro dos parênteses na posição delimitada pelos pelos dois outros elementos de dentro do parêntese.
  image(imgSecond2, 265, 0);
  image(imgMinute, 106, 0);
  image(imgMinute2, 159, 0);
  image(imgHour, 0, 0);
  image(imgHour2, 53, 0);
}

void relogio() {
  
  s1 = second()/10; //Os valores s1, m1 e h1 recebem os valores de cada elemento do tempo passadas pelo sistema e dividem por 10 para ter o número que será disposto a frente das unidades.
  s2 = second()%10; //Já os valores de s2, m2 e h2 recebem os valores do resto da divisão por 10 (utilizando o %) para saber qual o número corresponde a unidade em cada campo.
  m1 = minute()/10;
  m2 = minute()%10;
  h1 = hour()/10;
  h2 = hour()%10;

  switch(s1) { //Os switchs são utilizados para checar a cada frame qual o valor recebido por cada uma das 6 valores acima listadas e determinar que, caso h1 seja 1, a variável imgHour receberá a imagem 01.jpg, caso seja 2, receberá a imagem 02.jpg e assim sucessivamente.
  case 0: 
    imgSecond = loadImage("00.jpg");
    break;
  case 1: 
    imgSecond = loadImage("01.jpg");
    break;
  case 2: 
    imgSecond = loadImage("02.jpg");
    break;
  case 3: 
    imgSecond = loadImage("03.jpg");
    break;
  case 4: 
    imgSecond = loadImage("04.jpg");
    break;
  case 5: 
    imgSecond = loadImage("05.jpg");
    break;
  case 6: 
    imgSecond = loadImage("06.jpg");
    break;
  case 7: 
    imgSecond = loadImage("07.jpg");
    break;
  case 8: 
    imgSecond = loadImage("08.jpg");
    break;
  case 9: 
    imgSecond = loadImage("09.jpg");
    break;
  }
  
  switch(s2) {
  case 0: 
    imgSecond2 = loadImage("00.jpg");
    break;
  case 1: 
    imgSecond2 = loadImage("01.jpg");
    break;
  case 2: 
    imgSecond2 = loadImage("02.jpg");
    break;
  case 3: 
    imgSecond2 = loadImage("03.jpg");
    break;
  case 4: 
    imgSecond2 = loadImage("04.jpg");
    break;
  case 5: 
    imgSecond2 = loadImage("05.jpg");
    break;
  case 6: 
    imgSecond2 = loadImage("06.jpg");
    break;
  case 7: 
    imgSecond2 = loadImage("07.jpg");
    break;
  case 8: 
    imgSecond2 = loadImage("08.jpg");
    break;
  case 9: 
    imgSecond2 = loadImage("09.jpg");
    break;
  }

  switch(m1) {
  case 0: 
    imgMinute = loadImage("00.jpg");
    break;
  case 1: 
    imgMinute = loadImage("01.jpg");
    break;
  case 2: 
    imgMinute = loadImage("02.jpg");
    break;
  case 3: 
    imgMinute = loadImage("03.jpg");
    break;
  case 4: 
    imgMinute = loadImage("04.jpg");
    break;
  case 5: 
    imgMinute = loadImage("05.jpg");
    break;
  case 6: 
    imgMinute = loadImage("06.jpg");
    break;
  case 7: 
    imgMinute = loadImage("07.jpg");
    break;
  case 8: 
    imgMinute = loadImage("08.jpg");
    break;
  case 9: 
    imgMinute = loadImage("09.jpg");
    break;
  }
  
  switch(m2) {
  case 0: 
    imgMinute2 = loadImage("00.jpg");
    break;
  case 1: 
    imgMinute2 = loadImage("01.jpg");
    break;
  case 2: 
    imgMinute2 = loadImage("02.jpg");
    break;
  case 3: 
    imgMinute2 = loadImage("03.jpg");
    break;
  case 4: 
    imgMinute2 = loadImage("04.jpg");
    break;
  case 5: 
    imgMinute2 = loadImage("05.jpg");
    break;
  case 6: 
    imgMinute2 = loadImage("06.jpg");
    break;
  case 7: 
    imgMinute2 = loadImage("07.jpg");
    break;
  case 8: 
    imgMinute2 = loadImage("08.jpg");
    break;
  case 9: 
    imgMinute2 = loadImage("09.jpg");
    break;
  }

  switch(h1) {
  case 0: 
    imgHour = loadImage("00.jpg");
    break;
  case 1: 
    imgHour = loadImage("01.jpg");
    break;
  case 2: 
    imgHour = loadImage("02.jpg");
    break;
  case 3: 
    imgHour = loadImage("03.jpg");
    break;
  case 4: 
    imgHour = loadImage("04.jpg");
    break;
  case 5: 
    imgHour = loadImage("05.jpg");
    break;
  case 6: 
    imgHour = loadImage("06.jpg");
    break;
  case 7: 
    imgHour = loadImage("07.jpg");
    break;
  case 8: 
    imgHour = loadImage("08.jpg");
    break;
  case 9: 
    imgHour = loadImage("09.jpg");
    break;
  }

  switch(h2) {
  case 0: 
    imgHour2 = loadImage("00.jpg");
    break;
  case 1: 
    imgHour2 = loadImage("01.jpg");
    break;
  case 2: 
    imgHour2 = loadImage("02.jpg");
    break;
  case 3: 
    imgHour2 = loadImage("03.jpg");
    break;
  case 4: 
    imgHour2 = loadImage("04.jpg");
    break;
  case 5: 
    imgHour2 = loadImage("05.jpg");
    break;
  case 6: 
    imgHour2 = loadImage("06.jpg");
    break;
  case 7: 
    imgHour2 = loadImage("07.jpg");
    break;
  case 8: 
    imgHour2 = loadImage("08.jpg");
    break;
  case 9: 
    imgHour2 = loadImage("09.jpg");
    break;
  }
}



