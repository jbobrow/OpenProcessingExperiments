
/* Briefing 1
   Composição b) - Iteration
   Maryana Kruk #27300*/
      
float posX; /*Declarar variável decimal para posição horizontal*/
float posY; /*Declarar variável decimal para posição vertical*/
float diam; /*Declarar variável decimal para o diâmetro*/
float h; /*Declarar variável decimal para o valor de Hue*/
int totalObj; /*Declarar variável inteira para o número total de objectos*/

void setup(){ /*Função para estabelecer as definições do programa*/
  size(600,600); /*Definir tamanho da janela*/
  background(255); /*Definir cor de fundo - branco*/
  smooth(); /*Função para suavizar as formas*/
  noLoop(); /*Função para não deixar o programa entrar em repetição */
  totalObj = 25; /*Inicializar a variável "totalObj"*/
}

void draw(){ /*Função para desenhar*/
  colorMode(HSB, 360,100,100); /*Definir o modo da cor para HSB*/
  for ( int i = 0; i <totalObj; i++){ /*Ciclo for ocorre enquanto "i" for menor que o nº total de objectos*/
     posX=width/2; /*Inicializar a variável "posX"*/
     posY=random(-10,height+10); /*Inicializar a variável "posY" para valores aleatórios restritos*/
     h = map ( i, 0, totalObj, 75,360);  /*Inicializar variável "h", que vai depender da variável "i". Excerto de código adoptado da 
                                           05 COMPOSITION - Iteration de Rudolfo Quintas (example with position), incluindo a linha de código seguinte*/
     diam = map ( i, 0, totalObj, 400,10); /*Inicializar variável "diam", que vai depender da "i"*/ 
     noStroke(); /*Sem contorno*/
     fill(h,100,100); /*Preencher com cor (hue, saturation, brightness*/
     ellipse ( posX, posY, diam, diam); /*Desenhar uma elipse*/
  } 
      
}

