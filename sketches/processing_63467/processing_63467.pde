
PFont texto;//variavel de texto com o nome "texto"


void setup(){//definiçao das opçoes do set up
  
  size (600, 600);// tamanho da janela
  
  background (255);//cor de fundo
  
  smooth();//suavizar as formas
  
  noLoop();// sem movimento
  
  
  texto = loadFont ("CenturyGothic-Bold-48.vlw");// criaçao de uma fonte 
  //upload da fone para o processing
  
  textFont (texto, 50);//definir o tamanho da variavel de texto "texto"
}
void draw(){//definição das opçoes de desenho

fill (0);//preenchimento da cor em preto
rect (100, 50, 400, 475);//desenho de um rectangulo 
  
  //strokeWeight (5);
  //stroke (255);
  //noFill ();
  //rect (50, 25, 500, 525);
  
  
  noStroke();//sem contorno
  fill (0, 0, 121); // preenchimento com valor de azul 121
  rect (100, 50, 400, 100);// desenho de um rectangulo
  

  
  fill (255); // cor branca
  text ("Carlos", 150, 120);//desenho de texto com a palavra Carlos
  
  
  
  //fill(0, 0, 255);
  //rect (100, 250, 400, 25);
  
  //fill (0, 0, 121); 
  //rect (100, 175, 400, 100);
  
  
  
  
  //fill (0, 0, 121); 
  //rect (100, 300, 400, 100);
  
  
  fill (0, 0, 121);// preenchimento com valor de azul 121 
  rect (100, 425, 400, 100);// desenho de um rectangulo
  
  
  fill(0, 0, 121);// preenchimento com valor de azul 121
  rect (100, 175, 400, 10);// desenho de um rectangulo
  
  fill(0, 0, 121);// preenchimento com valor de azul 121
  rect (100, 265, 400, 10);// desenho de um rectangulo
  
    fill(0, 0, 121);// preenchimento com valor de azul 121
  rect (100, 295, 400, 10);// desenho de um rectangulo
  
  fill(0, 0, 121);// preenchimento com valor de azul 121
  rect (100, 390, 400, 10);// desenho de um rectangulo
  
   fill (255);  // cor branca
  text ("Daniel", 150, 240);//desenho de texto com a palavra Daniel
  
   fill (255);  // cor branca
  text ("Pereira", 150, 360);//desenho de texto com a palavra Pereira
  
   fill (255);  // cor branca
  text ("Maia", 150, 495);//desenho de texto com a palavra Maia
  
  
  fill(0, 0, 121);// preenchimento com valor de azul 121
  rect (80, 50, 10, 475);// desenho de um rectangulo
}

