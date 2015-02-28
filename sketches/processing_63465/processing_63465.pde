

int caga = 20000;// variavel para o numero de objecto = 20000

PFont texto;// variavel com a criação de texto

float r;//variavel para a cor r- vermelho
float g;;//variavel para a cor g- verde
float b;;//variavel para a cor b- azul

float posX, posY;// variavel para definir a posX e a posY

void setup(){//definiçao das opçoes do setup

size (600, 600);//tamanho da janela

background (0);//cor de fundo (preto)


smooth();//suavizar as formas

//noLoop();

texto = loadFont ("CenturyGothic-Bold-48.vlw");//criação de uma fonte
//upload dessa fonte para o processing

textFont (texto, 20);// definir o tamanho do texto

}
void draw(){//definiçoes das opçoes de desenho

noStroke();// sem contorno

for ( int i = 0; i < caga; i++){//variavel para gerar o numero de objectos = 20000
  
  posX = map (i, 0, caga, 0, width);//definiçao das coordenadas da variavel posX
  
  posY = random (height);//definiçao das coordenadas da variavel posY
  
  
  b = map (i, 0, caga, 0, 255);//definiçao dos valores da variavel de cor b- azul
  
  fill (0, 0, b);// cor azul
  ellipse (posX, posY, 20, 20);// desenho de uma elipse
 
 
} 
  
  //loop();
  
  stroke (255);//cor branco
  noFill();//sem prenchimento
  rect (mouseX, mouseY, 25, 25);//desenho de um quadrado situado no crossor do computador
  
  fill (255);//cor branco
  text ("value:" + mouseX, 100, 100);//desenho de texto com a palavra "value"
  //as coordenadas da Posiçao de X vao aumentando com o valor do crossor do rato
  
}

